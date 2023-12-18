// For medicine fields call back
$(document).ready(function() {
    // Hide the remove button for the initial medicine section
    $('.medicine-section .remove-medicine-section').hide();

    // Get the HTML template for a new medicine section
    let template = $('#templateID').html();

    // Add medicine section
    $(document).on('click', '.add-medicine-section', function() {
        var index = $('.medicine-section').length + 1;

        $('.medicine-section:last').after('<div class="medicine-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one medicine section
        if (index > 1) {
            $('.medicine-section:last').find('.remove-medicine-section').show();
        }
    });
     // Remove medicine section
    $(document).on('click', '.remove-medicine-section', function() {
        var medicineSections = $('.medicine-section');
        if (medicineSections.length > 1) {
            $(this).closest('.medicine-section').remove();

            // Hide the "Remove" button when there is only one medicine section left
            if (medicineSections.length === 1) {
                medicineSections.find('.remove-medicine-section').hide();
            }
        }
    });
});

// For labtest fields call back
$(document).ready(function() {
    // Hide the remove button for the initial labtest section
    $('.labtest-section .remove-labtest-section').hide();

    // Get the HTML template for a new labtest section
    let template = $('#templateID').html();

    // Add labtest section
    $(document).on('click', '.add-labtest-section', function() {
        var index = $('.labtest-section').length + 1;

        $('.labtest-section:last').after('<div class="labtest-section">' + template + '</div>');

        // Show the "Remove" button when there is more than one labtest section
        if (index > 1) {
            $('.labtest-section:last').find('.remove-labtest-section').show();
        }
    });
     // Remove labtest section
    $(document).on('click', '.remove-labtest-section', function() {
        var labtestSections = $('.labtest-section');
        if (labtestSections.length > 1) {
            $(this).closest('.labtest-section').remove();

            // Hide the "Remove" button when there is only one labtest section left
            if (labtestSections.length === 1) {
                labtestSections.find('.remove-labtest-section').hide();
            }
        }
    });
});

