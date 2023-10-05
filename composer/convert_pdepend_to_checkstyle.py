import xml.etree.ElementTree as ET
import sys

# Define the input and output file paths
input_file = '/var/lib/jenkins/workspace/checkstyle_php_loc_pdepend/composer/pdepend_summary.xml'  # Replace with your input file path
output_file = '/var/lib/jenkins/workspace/checkstyle_php_loc_pdepend/composer/pdepend_checkstyle_report.xml'  # Replace with your desired output file path

# Create a Checkstyle XML structure
checkstyle = ET.Element('checkstyle')

# Parse the PHP Depend XML report
tree = ET.parse(input_file)
root = tree.getroot()

# Iterate through the PHP Depend errors and convert them to Checkstyle format
for file_element in root.findall('.//package/file'):
    filename = file_element.get('name')
    for error in file_element.findall('.//error'):
        line = error.get('beginline')
        column = error.get('begincolumn')
        message = error.text
        severity = 'error'  # You can adjust the severity as needed

        # Create a Checkstyle entry for each error
        entry = ET.Element('error')
        entry.set('line', line)
        entry.set('column', column)
        entry.set('severity', severity)
        entry.set('message', message)
        entry.set('source', 'pdepend')

        # Create a file element for the Checkstyle entry
        file_entry = ET.Element('file')
        file_entry.set('name', filename)
        file_entry.append(entry)

        # Append the file element to the Checkstyle report
        checkstyle.append(file_entry)

# Write the Checkstyle report to the output file
checkstyle_tree = ET.ElementTree(checkstyle)
checkstyle_tree.write(output_file)

print(f'Checkstyle report saved to {output_file}')
