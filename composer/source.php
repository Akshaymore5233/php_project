<?php

// get the path to the report files
$report_files = glob("/var/lib/jenkins/codeanalysis/wordpress/output/*.xml");

// loop through the report files
foreach ($report_files as $report_file) {

    // get the report content
    $report_content = file_get_contents($report_file);

    // show the report content
    echo $report_content;
}

?>
