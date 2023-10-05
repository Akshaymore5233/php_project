#! /bin/bash
pwd
cd /var/lib/jenkins/workspace/phpstan_findbugs/phpstan
pwd
phpstan analyze --error-format=checkstyle > phpstan_checkstyle_report.xml
php convert_phpstan_to_findbugs.php > findbugs_report.xml
