#! /bin/bash
cd /var/lib/jenkins/workspace/checkstyle_php_loc_pdepend/composer

pdepend --jdepend-xml=pdepend_summary.xml /var/lib/jenkins/workspace/checkstyle_php_loc_pdepend/wordpress/
python3 convert_pdepend_to_checkstyle.py

