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
$(document).ready(function() {
            // Hide the "Remove" button for the initial lab test section
            $('.schedule-section .remove-schedule-section').hide();

            // Add schedule section
            $(document).on('click', '.add-schedule-section', function() {
                var section = $('.schedule-section:first').clone();
                section.find('input[type="time"]').val(''); // Clear input values in the cloned section
                section.find('input[type="time"]').val(''); // Clear input values in the cloned section
                section.find('.remove-schedule-section').show(); // Show the remove button for the cloned section

                // Update index number
                var index = $('.schedule-section').length + 1;
                section.find('.section-index').text('Working Time ' + index);

                section.appendTo('#schedule-sections');

                // Show the "Remove" button when there is more than one lab test section
                if (index > 1) {
                    section.find('.remove-schedule-section').show();
                }
            });

            // Remove appointment schedule section
            $(document).on('click', '.remove-schedule-section', function() {
                var scheduleSections = $('.schedule-section');
                if (scheduleSections.length > 1) {
                    $(this).closest('.schedule-section').remove();

                    // Update index numbers
                    scheduleSections.each(function(index) {
                        $(this).find('.section-index').text('Working Time No ' + (index + 1));
                    });

                    // Hide the "Remove" button when there is only one lab test section left
                    if (scheduleSections.length === 1) {
                        scheduleSections.find('.remove-schedule-section').hide();
                    }
                }
            });
        });

$(document).ready(function() {
            // Hide the "Remove" button for the initial lab test section
            $('.off-day-section .remove-off-day-section').hide();

            // Add schedule section
            $(document).on('click', '.add-off-day-section', function() {
                var section = $('.off-day-section:first').clone();
                section.find('input[type="text"]').val(''); // Clear input values in the cloned section
                section.find('.remove-off-day-section').show(); // Show the remove button for the cloned section

                // Update index number
                var index = $('.off-day-section').length + 1;
                section.find('.section-index').text('Working Time ' + index);

                section.appendTo('#off-day-sections');

                // Show the "Remove" button when there is more than one lab test section
                if (index > 1) {
                    section.find('.remove-off-day-section').show();
                }
            });

            // Remove appointment schedule section
            $(document).on('click', '.remove-off-day-section', function() {
                var scheduleSections = $('.off-day-section');
                if (scheduleSections.length > 1) {
                    $(this).closest('.off-day-section').remove();

                    // Update index numbers
                    scheduleSections.each(function(index) {
                        $(this).find('.section-index').text('Working Time No ' + (index + 1));
                    });

                    // Hide the "Remove" button when there is only one lab test section left
                    if (scheduleSections.length === 1) {
                        scheduleSections.find('.remove-off-day-section').hide();
                    }
                }
            });
        });

$(document).ready(function() {
            // Hide the "Remove" button for the initial lab test section
            $('.award-section .remove-award-section').hide();

            let template = $('#templateID').html()

            // Add schedule section
            $(document).on('click', '.add-award-section', function() {
//                var section = $('.award-section:first').clone();
//                console.log(section)
//                section.find('input[type="text"]').val(''); // Clear input values in the cloned section
//                section.find('.remove-award-section').show(); // Show the remove button for the cloned section
//                section.appendTo('#award-sections');
                  $('.award-section').append(template);

                // Show the "Remove" button when there is more than one lab test section
                if (index > 1) {
                    section.find('.remove-award-section').show();
                }
            });

            // Remove appointment schedule section
            $(document).on('click', '.remove-award-section', function() {
                var scheduleSections = $('.award-section');
                if (scheduleSections.length > 1) {
                    $(this).closest('.award-section').remove();

                    // Hide the "Remove" button when there is only one lab test section left
                    if (scheduleSections.length === 1) {
                        scheduleSections.find('.remove-award-section').hide();
                    }
                }
            });
        });
