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

// for award section
$(document).ready(function() {
    // Hide the "Remove" button for the initial award section
    $('.award-section .remove-award-section').hide();

    // Get the HTML template for a new award section
    let template = $('#templateID').html();

    // Add award section
    $(document).on('click', '.add-award-section', function() {
        var index = $('.award-section').length + 1;

        $('.award-section:last').after('<div class="award-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one award section
        if (index > 1) {
            $('.award-section:last').find('.remove-award-section').show();
        }
    });

    // Remove award section
    $(document).on('click', '.remove-award-section', function() {
        var awardSections = $('.award-section');
        if (awardSections.length > 1) {
            $(this).closest('.award-section').remove();

            // Hide the "Remove" button when there is only one award section left
            if (awardSections.length === 1) {
                awardSections.find('.remove-award-section').hide();
            }
        }
    });
});

// For education fields call back
$(document).ready(function() {
    // Hide the remove button for the initial education section
    $('.education-section .remove-education-section').hide();

    // Get the HTML template for a new education section
    let template = $('#templateID').html();

    // Add education section
    $(document).on('click', '.add-education-section', function() {
        var index = $('.education-section').length + 1;

        $('.education-section:last').after('<div class="education-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one education section
        if (index > 1) {
            $('.education-section:last').find('.remove-education-section').show();
        }
    });
     // Remove education section
    $(document).on('click', '.remove-education-section', function() {
        var educationSections = $('.education-section');
        if (educationSections.length > 1) {
            $(this).closest('.education-section').remove();

            // Hide the "Remove" button when there is only one education section left
            if (educationSections.length === 1) {
                educationSections.find('.remove-education-section').hide();
            }
        }
    });
});