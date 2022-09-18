## Exports
export REPOS="$HOME/Repos"
export GATELESS="$HOME/Repos/gateless"
export PATH="$GATELESS/sdf/bin:$PATH"
export TIME_STYLE='long-iso'
export GRX_SSH_USER="justin.frost@gateless.com"
export ENV="${ENV:=stage}"

touch_envrc() {
  echo "export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain gateless --domain-owner 546781284141 --query authorizationToken --output text`\n" > .envrc
}

get-execution-description () {
  local EXECUTION="$1"
  local EXECUTION_ID="$2"
  local ARN="arn:aws:states:us-east-1:546781284141:execution:$EXECUTION:$EXECUTION_ID"
  aws stepfunctions describe-execution --execution-arn $ARN
}

get-execution-id-list () {
  local EXECUTION="$1"
  local JSON_QUERY='.executions[] | .name'
  local ARN="arn:aws:states:us-east-1:546781284141:stateMachine:$EXECUTION"
  aws stepfunctions list-executions --state-machine-arn $ARN  | jq -r $JSON_QUERY
}

get-execution-input () {
  local AWS_ENV=${ENV:-stage}
  local EXECUTION="$1"
  local EXECUTION_FORMATTED="$EXECUTION-$AWS_ENV"
  local EXECUTION_ID="$2"
  local JSON_QUERY='.input | fromjson'
  get-execution-description $EXECUTION_FORMATTED $EXECUTION_ID | jq -r $JSON_QUERY
}

get-execution-output () {
  local AWS_ENV=${ENV:-stage}
  local EXECUTION="$1"
  local EXECUTION_FORMATTED="$EXECUTION-$AWS_ENV"
  local EXECUTION_ID="$2"
  local JSON_QUERY='.output | fromjson'
  get-execution-description $EXECUTION_FORMATTED $EXECUTION_ID | jq -r $JSON_QUERY
}

get-session-binary-uri () {
  local AWS_ENV=${ENV:-stage}
  local EXECUTION="conditions-sync-from-rules-$AWS_ENV"
  local EXECUTION_ID="$1"
  local JSON_QUERY='.input | fromjson | ."resource-uri"'
  get-execution-description $EXECUTION $EXECUTION_ID | jq -r $JSON_QUERY
}

get-document-resource-uri () {
  local AWS_ENV=${ENV:-stage}
  local EXECUTION="mortgage-case-process-resource-$AWS_ENV"
  local EXECUTION_ID="$1"
  local JSON_QUERY='.input | fromjson | ."resource-uri"'
  get-execution-description $EXECUTION $EXECUTION_ID | jq -r $JSON_QUERY
}


## For the future times:
## aws query to get all executions, filter by the loan number
test-run () {
  export ENV=stage
#  local JSON_QUERY=".encompass-loan-data | .data | select(.encompass-loan-number == \"$1\")"
  local JSON_QUERY=".output | fromjson | .\"encompass-loan-data\" | .\"data\" | select(.\"encompass-loan-number\" == \"$1\")"
  local execution_ids=( $(get-execution-id-list "mortgage-case-process-resource-$ENV") )
  for i in "${execution_ids[@]}"; do
    echo "parse using" $JSON_QUERY
    get-execution-description "mortgage-case-process-resource-$ENV" $i | jq -r $JSON_QUERY
    #foreach loan ( $(get-execution-output "mortgage-case-process-resource" $id | jq -r $JSON_QUERY) )
    #echo "Checking get-execution-output mortgage-case-process-resource $id | jq -r" $JSON_QUERY
     # get-document-resource-uri $id
    #end
  done
}

## Tail logs for rules
tail-rules-service() {
    local AWS_ENV=${ENV:-stage}
    local AWS_PATH="/${AWS_ENV}/ecs/rules-service"
    echo "Tailing log for $AWS_PATH"
    rlwrap cw tail -b 15m -f $AWS_PATH --grep='{ ($.exception = *)  && ($.level != "WARN") && ($.exception = "Condition exception raised" || $.exception = "*Exception in*ruleset*") }' -f | jq -r '.'
}
