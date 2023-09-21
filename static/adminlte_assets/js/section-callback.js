// For organ and organ problem specification fields call back
$(document).ready(function() {
        // Hide the remove button for the initial section
        $('.section-callback').first().find('.remove-section-callback').hide();

        // Add section
        $(document).on('click', '.add-section-callback', function() {
            var section = $('.section-callback').first().clone();
            section.find('input[name="names[]"]').val(''); // Clear input values in the cloned section
            section.find('textarea[name="descriptions[]"]').val('N/A');; // Clear textarea value in the cloned section
            section.find('input[name="problems[]"]').val(''); // Clear input values in the cloned section
            section.find('textarea[name="problem_specifications[]"]').val('N/A'); // Clear textarea value in the cloned section
            section.find('.section-index').text('No ' + ($('.section-callback').length + 1)); // Update section index
            section.find('.remove-section-callback').show(); // Show the remove button for the cloned section

            section.appendTo('#section-callbacks');

            // Show the remove button when there is more than one section
            $('.section-callback').find('.remove-section-callback').show();
        });

        // Remove section
        $(document).on('click', '.remove-section-callback', function() {
                if ($('.section-callback').length > 1) {
                    $(this).closest('.section-callback').remove();

                    // Update section indexes
                    $('.section-callback').each(function(index) {
                        $(this).find('.section-index').text('No ' + (index + 1));
                    });

                    if ($('.section-callback').length === 1) {
                    $('.section-callback .remove-section-callback').hide();
                }
            }
        });
    });

// For education fields call back
$(document).ready(function() {
    // Hide the remove button for the initial education section
    $('.education-section .remove-education-section').hide();

    // Add education section
    $('.add-education-section').click(function() {
        var section = $('.education-section').first().clone();
        section.find('input').val(''); // Clear input values in the cloned section
        section.find('.remove-education-section').show(); // Show the remove button for the cloned section

        // Update index number
        var index = $('.education-section').length;
        section.find('.section-index').text('Certificate Or Degree No ' + (index + 1));

        section.appendTo('#education-sections');

        // Show the remove button when there is more than one education section
        if (index > 0) {
            $('.education-section .remove-education-section').show();
        }
    });

    // Remove education section
    $(document).on('click', '.remove-education-section', function() {
        if ($('.education-section').length > 1) {
            $(this).closest('.education-section').remove();

            // Update index numbers
            $('.education-section').each(function(index) {
                $(this).find('.section-index').text('Certificate Or Degree No : ' + (index + 1));
            });

            // Hide the remove button when there is only one education section left
            if ($('.education-section').length === 1) {
                $('.education-section .remove-education-section').hide();
            }
        }
    });
});