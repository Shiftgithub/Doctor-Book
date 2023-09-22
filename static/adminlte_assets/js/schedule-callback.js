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
