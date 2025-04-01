
java -Xmx96G -jar /usr/local/bin/juicer/juicer_tools_1.22.01.jar pre \
      G_maculatum_BF73-hap2-JBAT.txt G_maculatum_BF73-hap2-JBAT.hic <(cat G_maculatum_BF73-hap2-JBAT.log | grep PRE_C_SIZE | awk '{print $2" "$3}')

