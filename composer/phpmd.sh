#! /bin/bash
cd /var/lib/jenkins/workspace/phpmd/composer
phpmd /var/lib/jenkins/workspace/code_analysis/wordpress/index.php xml ruleset.xml --reportfile phpmd_report.xml
cat phpmd_report.xml >> xyz.xml
