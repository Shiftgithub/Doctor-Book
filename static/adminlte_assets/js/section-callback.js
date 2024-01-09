// For organ fields call back
$(document).ready(function() {
    // Hide the remove button for the initial organ section
    $('.organ-section .remove-organ-section').hide();

    // Get the HTML template for a new organ section
    let template = $('#templateID').html();

    // Add organ section
    $(document).on('click', '.add-organ-section', function() {
        var index = $('.organ-section').length + 1;

        $('.organ-section:last').after('<div class="organ-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one organ section
        if (index > 1) {
            $('.organ-section:last').find('.remove-organ-section').show();
        }
    });
     // Remove organ section
    $(document).on('click', '.remove-organ-section', function() {
        var organSections = $('.organ-section');
        if (organSections.length > 1) {
            $(this).closest('.organ-section').remove();

            // Hide the "Remove" button when there is only one organ section left
            if (organSections.length === 1) {
                organSections.find('.remove-organ-section').hide();
            }
        }
    });
});

// For specification fields call back
$(document).ready(function() {
    // Hide the remove button for the initial specification section
    $('.specification-section .remove-specification-section').hide();

    // Get the HTML template for a new specification section
    let template = $('#templateID').html();

    // Add specification section
    $(document).on('click', '.add-specification-section', function() {
        var index = $('.specification-section').length + 1;

        $('.specification-section:last').after('<div class="specification-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one specification section
        if (index > 1) {
            $('.specification-section:last').find('.remove-specification-section').show();
        }
    });
     // Remove specification section
    $(document).on('click', '.remove-specification-section', function() {
        var specificationSections = $('.specification-section');
        if (specificationSections.length > 1) {
            $(this).closest('.specification-section').remove();

            // Hide the "Remove" button when there is only one specification section left
            if (specificationSections.length === 1) {
                specificationSections.find('.remove-specification-section').hide();
            }
        }
    });
});


// For schedule fields call back
$(document).ready(function() {
    // Hide the remove button for the initial schedule section
    $('.schedule-section .remove-schedule-section').hide();

    // Get the HTML template for a new schedule section
    let template = $('#templateID').html();

    // Add schedule section
    $(document).on('click', '.add-schedule-section', function() {
        var index = $('.schedule-section').length + 1;

        $('.schedule-section:last').after('<div class="schedule-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one schedule section
        if (index > 1) {
            $('.schedule-section:last').find('.remove-schedule-section').show();
        }
    });
     // Remove schedule section
    $(document).on('click', '.remove-schedule-section', function() {
        var scheduleSections = $('.schedule-section');
        if (scheduleSections.length > 1) {
            $(this).closest('.schedule-section').remove();

            // Hide the "Remove" button when there is only one schedule section left
            if (scheduleSections.length === 1) {
                scheduleSections.find('.remove-schedule-section').hide();
            }
        }
    });
});

// For off-day fields call back
$(document).ready(function() {
    // Hide the remove button for the initial off-day section
    $('.off-day-section .remove-off-day-section').hide();

    // Get the HTML template for a new off-day section
    let template = $('#offDayTemplateID').html();

    // Add off-day section
    $(document).on('click', '.add-off-day-section', function() {
        var index = $('.off-day-section').length + 1;

        $('.off-day-section:last').after('<div class="off-day-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one off-day section
        if (index > 1) {
            $('.off-day-section:last').find('.remove-off-day-section').show();
        }
    });
     // Remove off-day section
    $(document).on('click', '.remove-off-day-section', function() {
        var offDaySections = $('.off-day-section');
        if (offDaySections.length > 1) {
            $(this).closest('.off-day-section').remove();

            // Hide the "Remove" button when there is only one off-day section left
            if (offDaySections.length === 1) {
                offDaySections.find('.remove-off-day-section').hide();
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