$(document).ready(function() {
            // Hide the "Remove" button for the initial lab test section
            $('.labtest-section .remove-labtest-section').hide();

            // Add lab test section
            $(document).on('click', '.add-labtest-section', function() {
                var section = $('.labtest-section:first').clone();
                section.find('input[type="text"]').val(''); // Clear input values in the cloned section
                section.find('.remove-labtest-section').show(); // Show the remove button for the cloned section

                // Update index number
                var index = $('.labtest-section').length + 1;
                section.find('.section-index').text('Lab Test No ' + index);

                section.appendTo('#labtest-sections');

                // Show the "Remove" button when there is more than one lab test section
                if (index > 1) {
                    section.find('.remove-labtest-section').show();
                }
            });

            // Remove lab test section
            $(document).on('click', '.remove-labtest-section', function() {
                var labtestSections = $('.labtest-section');
                if (labtestSections.length > 1) {
                    $(this).closest('.labtest-section').remove();

                    // Update index numbers
                    labtestSections.each(function(index) {
                        $(this).find('.section-index').text('Lab Test No ' + (index + 1));
                    });

                    // Hide the "Remove" button when there is only one lab test section left
                    if (labtestSections.length === 1) {
                        labtestSections.find('.remove-labtest-section').hide();
                    }
                }
            });
        });
$(document).ready(function() {
            // Hide the "Remove" button for the initial lab test section
            $('.medicine-section .remove-medicine-section').hide();

            // Add lab test section
            $(document).on('click', '.add-medicine-section', function() {
                var section = $('.medicine-section:first').clone();
                section.find('input[type="text"]').val(''); // Clear input values in the cloned section
                section.find('.remove-medicine-section').show(); // Show the remove button for the cloned section

                // Update index number
                var index = $('.medicine-section').length + 1;
                section.find('.section-index').text('Medicine No ' + index);

                section.appendTo('#medicine-sections');

                // Show the "Remove" button when there is more than one medicine section
                if (index > 1) {
                    section.find('.remove-medicine-section').show();
                }
            });

            // Remove lab test section
            $(document).on('click', '.remove-labtest-section', function() {
                var labtestSections = $('.labtest-section');
                if (labtestSections.length > 1) {
                    $(this).closest('.labtest-section').remove();

                    // Update index numbers
                    labtestSections.each(function(index) {
                        $(this).find('.section-index').text('Lab Test No ' + (index + 1));
                    });

                    // Hide the "Remove" button when there is only one lab test section left
                    if (labtestSections.length === 1) {
                        labtestSections.find('.remove-labtest-section').hide();
                    }
                }
            });
        });