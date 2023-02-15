createdirs () {
        cur=$1
        dirs=
        while [ $cur != / ]; do
                if [ -d $cur ]; then
                        break
                fi
                dirs="$cur $dirs"
                cur=`dirname $cur`
        done

        for dir in $dirs; do
                mkdir $dir
        done
}

