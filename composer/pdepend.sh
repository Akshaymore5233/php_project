#! /bin/bash
cd /var/lib/jenkins/workspace/pdepend/composer

pdepend --jdepend-xml=pdepend_summary.xml /var/lib/jenkins/workspace/pdepend/wordpress/
python3 convert_pdepend_to_checkstyle.py

