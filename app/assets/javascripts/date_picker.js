
// $(document).ready(function() {
//     'use strict';
//
//     var datePicker = $('#DateRange');
//
//     $('input[name="DateType"]').change(function() {
//         if (this.value == "Single") {
//             datePicker.attr("data-key", "single");
//         } else {
//             datePicker.attr("data-key", "multi");
//         }
//         $('input[data-key="single"]').daterangepicker({
//             "singleDatePicker": true,
//             isInvalidDate: function(date) {
//                 var day = new Date(date);
//                 return day.getDay() == 0;
//             }
//         });
//
//         $('input[data-key="multi"]').daterangepicker({
//             "autoApply": true,
//             isInvalidDate: function(date) {
//                 var day = new Date(date);
//                 return day.getDay() == 0;
//             }
//         });
//     });
//
//     $('input[data-key="single"]').daterangepicker({
//         "singleDatePicker": true,
//         isInvalidDate: function(date) {
//             var day = new Date(date);
//             return day.getDay() == 0;
//         }
//     });
//
//     $('input[data-key="multi"]').daterangepicker({
//         "autoApply": true
//     });
// });