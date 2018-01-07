#/bin/bash

cp banjo_pandapas/bikmeans2/y1.txt y1.txt
cp banjo_pandapas/bikmeans2/y2.txt y2.txt
cp banjo_pandapas/bikmeans2/y3.txt y3.txt
cp banjo_pandapas/bikmeans2/y4.txt y4.txt
cp banjo_pandapas/bikmeans2/y5.txt y5.txt
cp banjo_pandapas/bikmeans2/y6.txt y6.txt
cp banjo_pandapas/bikmeans2/y7.txt y7.txt
cp banjo_pandapas/bikmeans2/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_bikmeans2_consensus.txt

cp banjo_pandapas/i2/y1.txt y1.txt
cp banjo_pandapas/i2/y2.txt y2.txt
cp banjo_pandapas/i2/y3.txt y3.txt
cp banjo_pandapas/i2/y4.txt y4.txt
cp banjo_pandapas/i2/y5.txt y5.txt
cp banjo_pandapas/i2/y6.txt y6.txt
cp banjo_pandapas/i2/y7.txt y7.txt
cp banjo_pandapas/i2/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_i2_consensus.txt


cp banjo_pandapas/kmeans2/y1.txt y1.txt
cp banjo_pandapas/kmeans2/y2.txt y2.txt
cp banjo_pandapas/kmeans2/y3.txt y3.txt
cp banjo_pandapas/kmeans2/y4.txt y4.txt
cp banjo_pandapas/kmeans2/y5.txt y5.txt
cp banjo_pandapas/kmeans2/y6.txt y6.txt
cp banjo_pandapas/kmeans2/y7.txt y7.txt
cp banjo_pandapas/kmeans2/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_kmeans2_consensus.txt

cp banjo_pandapas/max25/y1.txt y1.txt
cp banjo_pandapas/max25/y2.txt y2.txt
cp banjo_pandapas/max25/y3.txt y3.txt
cp banjo_pandapas/max25/y4.txt y4.txt
cp banjo_pandapas/max25/y5.txt y5.txt
cp banjo_pandapas/max25/y6.txt y6.txt
cp banjo_pandapas/max25/y7.txt y7.txt
cp banjo_pandapas/max25/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_max25_consensus.txt

cp banjo_pandapas/max50/y1.txt y1.txt
cp banjo_pandapas/max50/y2.txt y2.txt
cp banjo_pandapas/max50/y3.txt y3.txt
cp banjo_pandapas/max50/y4.txt y4.txt
cp banjo_pandapas/max50/y5.txt y5.txt
cp banjo_pandapas/max50/y6.txt y6.txt
cp banjo_pandapas/max50/y7.txt y7.txt
cp banjo_pandapas/max50/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_max50_consensus.txt

cp banjo_pandapas/max75/y1.txt y1.txt
cp banjo_pandapas/max75/y2.txt y2.txt
cp banjo_pandapas/max75/y3.txt y3.txt
cp banjo_pandapas/max75/y4.txt y4.txt
cp banjo_pandapas/max75/y5.txt y5.txt
cp banjo_pandapas/max75/y6.txt y6.txt
cp banjo_pandapas/max75/y7.txt y7.txt
cp banjo_pandapas/max75/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_max75_consensus.txt


cp banjo_pandapas/mean2/y1.txt y1.txt
cp banjo_pandapas/mean2/y2.txt y2.txt
cp banjo_pandapas/mean2/y3.txt y3.txt
cp banjo_pandapas/mean2/y4.txt y4.txt
cp banjo_pandapas/mean2/y5.txt y5.txt
cp banjo_pandapas/mean2/y6.txt y6.txt
cp banjo_pandapas/mean2/y7.txt y7.txt
cp banjo_pandapas/mean2/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_mean2_consensus.txt



cp banjo_pandapas/q2/y1.txt y1.txt
cp banjo_pandapas/q2/y2.txt y2.txt
cp banjo_pandapas/q2/y3.txt y3.txt
cp banjo_pandapas/q2/y4.txt y4.txt
cp banjo_pandapas/q2/y5.txt y5.txt
cp banjo_pandapas/q2/y6.txt y6.txt
cp banjo_pandapas/q2/y7.txt y7.txt
cp banjo_pandapas/q2/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_q2_consensus.txt



cp banjo_pandapas/TDT/y1.txt y1.txt
cp banjo_pandapas/TDT/y2.txt y2.txt
cp banjo_pandapas/TDT/y3.txt y3.txt
cp banjo_pandapas/TDT/y4.txt y4.txt
cp banjo_pandapas/TDT/y5.txt y5.txt
cp banjo_pandapas/TDT/y6.txt y6.txt
cp banjo_pandapas/TDT/y7.txt y7.txt
cp banjo_pandapas/TDT/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_TDT_consensus.txt


cp banjo_pandapas/top25/y1.txt y1.txt
cp banjo_pandapas/top25/y2.txt y2.txt
cp banjo_pandapas/top25/y3.txt y3.txt
cp banjo_pandapas/top25/y4.txt y4.txt
cp banjo_pandapas/top25/y5.txt y5.txt
cp banjo_pandapas/top25/y6.txt y6.txt
cp banjo_pandapas/top25/y7.txt y7.txt
cp banjo_pandapas/top25/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_top25_consensus.txt



cp banjo_pandapas/top75/y1.txt y1.txt
cp banjo_pandapas/top75/y2.txt y2.txt
cp banjo_pandapas/top75/y3.txt y3.txt
cp banjo_pandapas/top75/y4.txt y4.txt
cp banjo_pandapas/top75/y5.txt y5.txt
cp banjo_pandapas/top75/y6.txt y6.txt
cp banjo_pandapas/top75/y7.txt y7.txt
cp banjo_pandapas/top75/y8.txt y8.txt

java -jar banjo2.jar settingsFile=DBNwt1.txt
java -jar banjo2.jar settingsFile=DBNwt2.txt
java -jar banjo2.jar settingsFile=DBNwt3.txt
java -jar banjo2.jar settingsFile=DBNwt4.txt
java -jar banjo2.jar settingsFile=DBNwt5.txt
java -jar banjo2.jar settingsFile=DBNwt6.txt
java -jar banjo2.jar settingsFile=DBNwt7.txt
java -jar banjo2.jar settingsFile=DBNwt8.txt

rm -r d.wt*.txt
rm -r y*.txt
mv graph.consensus.txt banjo_pandapas/2_top75_consensus.txt
