#! /bin/bash
cd /var/lib/jenkins/workspace/code_analysis/composer
phpcpd --log-pmd cpd.xml /var/lib/jenkins/workspace/code_analysis/wordpress/
