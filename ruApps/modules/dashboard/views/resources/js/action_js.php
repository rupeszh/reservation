<script>
    !function($) {
        $.fn.shop = function(method) {

            var settings;

            var methods = {
                init: function(options) {

                    settings = $.extend(true, {}, this.shop.defaults, options);

                    return this.each(function() {
                        var $this = $(this);

                        $(this).selectize({
                            valueField: 'id',
                            labelField: 'personincharge',
                            searchField: 'company',
                            options: [],
                            create: false,
                            render: {
                                option: function(item, escape) {
                                    //console.log(item);
                                    return '<div data-company="' + item.company + '" data-personincharge="' + item.personincharge + '">' +
                                            '<span class="label1"><span class="label1_header">Company : </span><span class="label1_value">' + item.company + '</span></span>' +
                                            '<span class="label1"><span class="label1_header">Incharge : </span><span class="label1_value">' + item.personincharge + '</span></span>' +
                                            '</div>';
                                }
                            },
                            load: function(query, callback) {
                                if (!query.length)
                                    return callback();

                                var action_id = [];

                                $('.hiddenPersonIncharge').each(function(index) {
                                    action_id[index] = $(this).attr('value');
                                })

                                $.ajax({
                                    url: "<?php echo base_url(); ?>dashboard/personInchargeList",
                                    type: 'POST',
                                    dataType: 'json',
                                    data: {
                                        searchtext: query,
                                        page_limit: 20,
                                        shop_id: shop_id,
                                        action_id: action_id
                                    },
                                    error: function() {
                                        callback();
                                    },
                                    success: function(res) {
                                        //console.log(res);
                                        callback(res);
                                    }
                                });
                            },
                            onItemAdd: function(value, item) {

                                var company = $('.selectize-dropdown-content div.selected').data('company');
                                var personIncharge = $('.selectize-dropdown-content div.selected').data('personincharge');
                                var data = '<div style="display: inline-block; padding: 5px; width: 97%;margin-bottom: 5px;background-color: #eee;">' +
                                        '<div style="float: left; width: 80%;">' +
                                        '<div>' + company + '</div>' +
                                        '<div>' + personIncharge + '</div>' +
                                        '</div>' +
                                        '<input type="hidden" class="hiddenPersonIncharge" name="hiddenPersonIncharge[]" value="' + value + '">' +
                                        '<div style="float: right; line-height: 25px;" class="btn btn-default removeInchargeBtn">delete</div>' +
                                        '</div>';

                                $('#selectedPersonIncharge').prepend(data);

                                this.clearOptions();
                            }
                        });
                    });
                }
            };

            if (methods[ method ]) {
                return methods[ method ].apply(this, Array.prototype.slice.call(arguments, 1));
            }
            else if (typeof method === "object" || !method) {
                return methods.init.apply(this, arguments);
            }
            else {
                $.error("Method " + method + " does not exist in jQuery.shop.");
            }
        };
    }(window.jQuery);

    $(document).ready(function() {
        $(".shop").shop();
    });

    var list = '';


    $(document).on('click', '.removeInchargeBtn', function() {
        $(this).parent().remove();

        return false;
    });

    $(function() {
        $('#shopActionForm').validate();

        $('#date').datepicker({dateFormat: 'yy-mm-dd'});

        $('#timeFrom').timepicker();
        $('#timeTo').timepicker();

    });

</script>

<script src="<?php echo base_url() ?>assets/selectize/js/selectize.min.js"></script>
<link href="<?php echo base_url() ?>assets/selectize/css/selectize.default.css" rel="stylesheet" media="screen" />