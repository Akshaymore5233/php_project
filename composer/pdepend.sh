#! /bin/bash
cd /var/lib/jenkins/workspace/pdepend/composer

pdepend --jdepend-xml=report.xml /var/lib/jenkins/workspace/pdepend/wordpress/
cat report.xml
