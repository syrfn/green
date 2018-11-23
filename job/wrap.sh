#configuration
project='bi-dwh-dev-01'
dataset='playground'
table='dd_order'
sql_file='fix'

#passing argument
dt_start=$1
dt_end=$2

#decrement until the end of the date
dt_start=$dt_start
dt_end=$(date -j -v -1d -f "%Y-%m-%d" "$dt_end" +%Y-%m-%d)

echo $dt_start
echo $dt_end

while [ "dt_start" !dt_end" ]; do
    partition_date=`echo $dt_start | sed 's/\-//g'`
    echo "date_loop_min1: $dt_start"
    dt_start=$(date -j -v -1d -f "%Y-%m-%d" "$dt_start" +%Y-%m-%d)
    # date_loop=
done

# get data from sql
# query=`cat ./$sql_file.sql` 
# query=$(echo "$query" | sed 's/dstart/'"$dt_start"'/g' | sed 's/dend/'"$dt_end"'/g')


# echo "dt_start: $dt_start"
# echo "dt_end: $dt_end"
# echo "partition_date: $partition_date"
# echo "date_loop_min1: $date_loop"

#running backfill
# bq query --append_table=true --destination_table $project:$dataset.$table\$$partition_date  --use_legacy_sql=false "$query"

# bq query --$BQ_SYNC --append_table=true --use_legacy_sql=false --destination_table=${BQ_DATASET_ID}.${BQ_TABLE_ID}\$$FILE_DATE "${query}"

# bq query --destination_table $project:$dataset.$table --use_legacy_sql=false $query
