#! /bin/bash
cd /var/lib/jenkins/workspace/code_analysis/composer

pdepend --jdepend-xml=report.xml /var/lib/jenkins/workspace/pdepend/wordpress/index.php
cat report.xml
