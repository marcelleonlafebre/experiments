#presto 20 workers
#archivo_query="query23_1_p.sql"
#./minerva_presto.sh $archivo_query >presto_23q_3tb.log
#archivo_query1="query47_p.sql"
#./minerva_presto.sh $archivo_query1 >presto_47q_3tb.log
#archivo_query2="query64_p.sql"
#./minerva_presto.sh $archivo_query2 >presto_64q_3tb.log
#revisarporquenoapagocluster#archivo_query3="query80_p.sql"
#./minerva_presto.sh $archivo_query3 >presto_80q_3tb.log
#pendientearchivo_query4="tpcds_query67a_p.sql"
#pendiente./minerva_presto.sh $archivo_query4 >presto_67q_3tb.log
#pendientearchivo_query5="query14_1_p.sql"
#pendiente./minerva_presto.sh $archivo_query5 >presto_14q_3tb.log
#hive 20 workers
#archivo_query="query23_1.sql"
#./minerva_hive.sh $archivo_query >hive_23q_3tb.log
##archivo_query="query47o.sql"
##./minerva_hive.sh $archivo_query >hive_47q_3tb_o.log
##archivo_query="query64o.sql"
##./minerva_hive.sh $archivo_query >hive_64q_3tb_o.log
#archivo_query="query80a.sql"
#./minerva_hive.sh $archivo_query >hive_80q_3tb.log error en query dat_add
#archivo_query="tpcds_query67a.sql" pendiente
#./minerva_hive.sh $archivo_query >hive_67q_3tb.log
##archivo_query="query14_1o.sql"
##./minerva_hive.sh $archivo_query >hive_14q_3tb_o.log
#spark 10 workers Debe ser de 1 en 1 porque se cuelga ejecucion interna de spark-sql
#archivo_query="query23_1.sql"
#./minerva_spark.sh $archivo_query >spark_23q_3tb.log
#archivo_query15="query47.sql"
#./minerva_spark.sh $archivo_query15 >spark_47q_3tb.log
#archivo_query="query64.sql"
#./minerva_spark.sh $archivo_query >spark_64q_3tb.log
#archivo_query="query80a.sql"
#./minerva_spark.sh $archivo_query >spark_80q_3tb.log
#archivo_query="tpcds_query67a.sql"
#./minerva_spark.sh $archivo_query >spark_67q_3tb.log
#archivo_query="query14_1.sql"
#./minerva_spark.sh $archivo_query >spark_14q_3tb.log
##archivo_query="query47.sql"
##./minerva_hive_inst.sh $archivo_query >hive_47q_3tb_ist.log
##archivo_query="query64.sql"
##./minerva_hive_inst.sh $archivo_query >hive_64q_3tb_i.log
##archivo_query="query14_1.sql"
##./minerva_hive_inst.sh $archivo_query >hive_14q_3tb_i.log
##archivo_query="query47c.sql"
##./minerva_hive_25.sh $archivo_query >hive_47q_3tb_25.log
#archivo_query="query64c.sql"
#./minerva_hive_25.sh $archivo_query >hive_64q_3tb_25.log
archivo_query="query14_1c.sql"
./minerva_hive_25.sh $archivo_query >hive_14q_3tb_25.log
