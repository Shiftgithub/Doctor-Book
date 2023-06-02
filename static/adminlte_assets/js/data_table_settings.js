"use strict";

$("#datatableID").DataTable({
    "responsive": true,
    "lengthChange": false,
    "autoWidth": false,
    "order": false,
    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
}).buttons().container().appendTo('#datatableID_wrapper .col-md-6:eq(0)');


$("#dataTable").DataTable({
    "responsive": true,
    "lengthChange": false,
    "autoWidth": false,
    "order": false,
    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
});

$("#dataTableExport").DataTable({
    "responsive": true,
    "lengthChange": false,
    "autoWidth": false,
    "order": false,
    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
}).buttons().container().appendTo('#dataTableExport_wrapper .col-md-6:eq(0)');

$("#dataTablePageEditable").DataTable({
    "responsive": true,
    "lengthChange": false,
    "autoWidth": false,
    "pageLength": 100,
    "order": false,
    "buttons": ["excel", "pdf", "print", "pageLength", "colvis"]
}).buttons().container().appendTo('#dataTablePageEditable_wrapper .col-md-6:eq(0)');

$("#dataTableUnordered").DataTable({
    "responsive": true,
    "lengthChange": false,
    "autoWidth": false,
    "order": false,
    "buttons": ["excel", "pdf", "print", "pageLength", "colvis"],
}).buttons().container().appendTo('#dataTableUnordered_wrapper .col-md-6:eq(0)');