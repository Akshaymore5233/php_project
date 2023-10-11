#! /bin/bash
#cd /var/lib/jenkins/workspace/checkstyle_report_phpcs/composer
phpcs --report=checkstyle --report-file=checkstyle.xml /var/lib/jenkins/workspace/checkstyle_report_phpcs/wordpress/*.php
