#! /bin/bash
cd /var/lib/jenkins/workspace/code_analysis/phpmd_report
vendor/bin/phpmd /var/lib/jenkins/workspace/code_analysis/wordpress/index.php xml codesize,controversial --reportfile /var/lib/jenkins/workspace/code_analysis/phpmd_report/xyz.xml
cat xyz.xml > pmd.xml
