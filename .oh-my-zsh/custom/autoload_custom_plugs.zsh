 # OMZ does not add nested comp dirs to fpath so do it here, assume *src has completions
#for plug in ${plugins[@]}; do
#    if [[ -d "$ZSH/custom/plugins/$plug" ]]; then
    # null glob - no error
#        for dir in "$ZSH/custom/plugins/$plug/"*src(N); do
#            if [[ -d "$dir" ]]; then
#                if [[ -z ${fpath[(r)$dir]} ]];then
#                    if [[ $dir = *override* ]]; then
#                        fpath=($dir $fpath)
#                    else
#                        fpath=($fpath $dir)
#                    fi
                # echo "add $dir to $fpath" >> "$ZPWR_LOGFILE"
#                fi
#            fi
#        done
#    fi
#done
