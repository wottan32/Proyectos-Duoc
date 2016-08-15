var AjaxForm =
        {
            error_msg: {msg: "Ha ocurrido un error", error: false, errstr: "", aborted: false, response: null},
            forms: null,
            init: function (options) {
                var obj = this;
                $.extend(this.options, this.default_options, options);
                this.forms = $('.ajax-form');
                this.forms.each(function () {
                    obj.bindEvent(this);
                });
            },
            default_options: {
                event: 'click',
                functions: {},
                ignore: null,
                submitOnEnter: true //Sólo aplicable para input
            },
            options: {},
            bindEvent: function (element) {
                var $el = $(element), element_options = {};
                if ($el.is('form')) {
                    element_options.is_form = true;
                    element_options.event = 'submit';
                    element_options.url = $el.attr('action');
                    element_options.type = $el.attr('method');
                    element_options.confirm = $el.data('ajax-form-confirm');
                } else {
                    element_options.is_form = false;
                    element_options.event = $el.data('ajax-form-event') || this.options.event;
                    element_options.url = $el.data('ajax-form-action');
                    element_options.type = $el.data('ajax-form-method');
                }
                element_options.before = this.options.functions[$el.data('ajax-form-before')];
                element_options.done = this.options.functions[$el.data('ajax-form-done')];
                if (element_options.is_form) {
                    this.bindForm($el, element_options);
                } else {
                    this.bindElement($el, element_options);
                }
            },
            bindForm: function ($el, element_options) {
                var obj = this;
                $el.bind('submit', function (evt) {
                    var el = this;
                    if (evt.isPropagationStopped()) {
                        return false;
                    }
                    if (element_options.confirm) {
                        if (!confirm(element_options.confirm)) {
                            return false;
                        }
                    }
                    obj.prepareXHR(element_options, el, $el);
                    return false;
                });
            },
            bindElement: function ($el, element_options) {
                var obj = this, $inpElements = $el.find(':input' + (this.options.ignore ? ":not(" + this.options.ignore + ")" : ""));
                if (!(this.options.submitOnEnter)) {
                    //TODO Deshabilitar que al presionar enter se suba el formulario
                }
                var $bind = null;
                if (element_options.event === 'click') {
                    $bind = $el;
                } else {
                    $bind = $inpElements;
                }
                $bind.bind(element_options.event, function (evt) {
                    var el = this;
                    if (evt.isPropagationStopped()) {
                        return false;
                    }
                    obj.prepareXHR(element_options, el, $el);
                });
            },
            prepareXHR: function (element_options, el, $el) {
                var obj = this;
                var jqXHR = $.ajax({
                    url: element_options.url,
                    type: element_options.type,
                    beforeSend: function (xqr) {
                        return element_options.before(xqr, el);
                    },
                    data: $el.find(':input').serialize(),
                    error: function (xqr, textStatus, errstr) {
                        obj.error_msg.error = true;
                        obj.error_msg.errstr = textStatus;
                        obj.error_msg.msg = errstr;
                        obj.error_msg.response = xqr.responseText;
                        element_options.done(obj.error_msg, el);
                    }
                });
                if (jqXHR) {
                    jqXHR.done(function (response) {
                        element_options.done(response, el);
                    });
                } else {
                    obj.error_msg.aborted = true;
                    element_options.done(obj.error_msg, el);
                }
            }
        };

var ValidForm =
        {
            forms: null,
            options: {},
            validating_form: null,
            init: function (options) {
                $.extend(this.options, this.default_options, options);
                this.forms = $('.valid-form');
                var obj = this;
                this.forms.bind('submit', function (evt) {
                    var form_valid = true, confirm_form = $(this).data('check-confirm'), check_function_name = $(this).data('check-valid-function');
                    var check_function = obj.options.check_functions[check_function_name] || function () {
                        return true;
                    };
                    obj.validating_form = this;
                    $(this).find('[data-check]:not(:disabled)').each(function () {
                        if (obj.checkInput(this)) {
                            return true;
                        }
                        form_valid = false;
                        obj.onError(this);
                        return false;
                    });
                    if (confirm_form !== undefined && form_valid) {
                        if (!confirm(confirm_form)) {
                            form_valid = false;
                        }
                    }
                    if (form_valid && !check_function($(obj.validating_form).serializeArray())) {
                        form_valid = false;
                    }

                    if (!form_valid) {
                        evt.stopPropagation();
                    }
                    return form_valid;
                });
            },
            valid_functions: {
                required: function (val, optional) {
                    if (optional && val === '') {
                        return true;
                    }
                    return val !== '';
                },
                selectable: function (val, optional) {
                    if (optional && (val === '' || val === '-1')) {
                        return true;
                    }
                    return this.required(val) && val !== "-1";
                },
                email: function (val, optional) {
                    if (optional && val === '') {
                        return true;
                    }
                    return this.required(val) && /^[_a-z0-9\-]+(\.[_a-z0-9\-]+)*@[a-z0-9\-]+(\.[a-z0-9\-]+)*(\.[a-z]{2,3})$/.test(val);
                },
                regexp: function (val, optional, regexp) {
                    if (optional && val === '') {
                        return true;
                    }
                    var rexp = new RegExp(regexp);
                    return this.required(val) && rexp.test(val);
                },
                date: function (val, optional, date_format, instance) {
                    if (optional && val === '') {
                        return true;
                    }
                    var date = null;
                    if (instance.date.fromFormat[date_format]) {
                        date = instance.date.fromFormat[date_format](val);
                    } else {
                        date = instance.date.fromFormat['dd-mm-yyyy'](val);
                    }
                    if (date === false) {
                        return false;
                    }
                    return instance.date.validate(date);
                },
                rut: function (val, optional, whatever, instance) {
                    if (val === '' && optional) {
                        return true;
                    }
                    if (!/^\d{1,9}-[0-9kK]/.test(val)) {
                        return false;
                    }
                    var rut_parts = val.split('-');
                    try {
                        var rut = rut_parts[0], dv = rut_parts[1].toString().toUpperCase();
                        return dv === instance.rut.getDV(rut);
                    } catch (e) {
                        return false;
                    }
                },
                numeric: function (val, optional, length) {
                    if (val === "" && optional) {
                        return true;
                    }
                    if (length) {
                        length = parseInt(length);
                        if (val.length !== length) {
                            return false;
                        }
                    }
                    return /^(\d+)$/.test(val);
                },
                file: function (val, optional, accept_types) {
                    if (val === "" && optional) {
                        return true;
                    }
                    var file_parts = val.split('.'),
                            ext = file_parts[file_parts.length - 1],
                            exts_accepted = accept_types.split(','),
                            ext_reg = new RegExp(exts_accepted.join('|'));
                    return ext_reg.test(ext);
                },
                'required-element-value': function (val, optional, element_condition, instance) {

                    var element_selector, condition;
                    var parsed_condition = element_condition.split("=");
                    element_selector = parsed_condition[0];
                    condition = parsed_condition[1];
                    if ($(instance.validating_form).find(element_selector).val() == condition) {
                        return this.required(val, optional);
                    }
                    return true;
                },
                radio: function (val, optional, radio_name, instance, element) {
                    var radios = $(element).find(":radio").filter(function(idx,radio){
                        return $(radio).attr('name') === radio_name;
                    });
                    return radios.filter(":not(:disabled)").length > 1 ? radios.filter(':checked').length === 1 : true;
                },
                range: function (val, optional, range) {
                    if (optional && val === "") {
                        return true;
                    }
                    var range_arr_tmp = range.split(';');
                    var range_arr = {min: null, max: null};
                    if (range_arr_tmp.length !== 2) {
                        console.log("Range must be in format min;max");
                        return true;
                    } else {
                        try {
                            range_arr.min = parseInt(range_arr_tmp[0]);
                            range_arr.max = parseInt(range_arr_tmp[1]);
                        } catch (e) {
                            console.log("Range min or max is not a number");
                            return true;
                        }
                    }
                    try {
                        val = val.replace(/,/g, '.');
                        var num = parseFloat(val);
                        if (!(num >= range_arr.min && num <= range_arr.max)) {
                            return false;
                        }
                    } catch (e) {
                        return false;
                    }
                    return true;
                },
                checkbox: function (val, optional, args, instance, element) {
                    var args = args.split(';');
                    if (args.length !== 2) {
                        console.log("Args of checkbox function must be [nameofelement];[numberofrequiredelements]");
                        return true;
                    }
                    var check_name = args[0];
                    var number_of_checks = args[1];
                    var checks = $(element).find(":checkbox").filter(function(idx,checkbox){
                        return $(checkbox).attr('name') === check_name;
                    });
                    return checks.filter(":not(:disabled)").length > 0 ? checks.filter(':checked').length >= number_of_checks : true;
                }
            },
            checkInput: function (input) {
                var $input = $(input);
                if ($input.data('check') || $input.hasClass('radio-check')) {
                    if (this.valid_functions[$input.data('check')]) {
                        var val = $input.val(),
                                is_optional = $input.data('check-optional') !== undefined,
                                arg = $input.data('check-arg') ? $input.data('check-arg') : null;
                        if (this.valid_functions[$input.data('check')](val, is_optional, arg, this, input)) {
                            return true;
                        } else {
                            return false;
                        }
                    } else {
                        console.log("No se encuentra el método de validación " + $input.data('check') + " establecido en " + $input.get(0).tagName + " con nombre " + $input.get(0).name);
                        return true;
                    }
                } else {
                    return true;
                }
            },
            default_options: {
                autofocus: false,
                clean_on_error: false,
                check_functions: {}
            },
            onError: function (elem) {
                var $elem = $(elem);
                if ($elem.data('check-msg')) {
                    alert($elem.data('check-msg'));
                }
                if (this.options.clean_on_error) {
                    $elem.val('');
                }
                if (this.options.autofocus) {
                    $elem.focus();
                }
            },
            date: {
                fromFormat: {
                    'dd/mm/yyyy': function (val) {
                        if (!/^\d{2}\/\d{2}\/\d{4}$/.test(val)) {
                            return false;
                        }
                        var split_date = val.split('/');
                        if (split_date.length !== 3) {
                            return false;
                        }
                        return {day: split_date[0], month: split_date[1], year: split_date[2]};
                    },
                    'dd-mm-yyyy': function (val) {
                        if (!/\d{2}-\d{2}-\d{4}$/.test(val)) {
                            return false;
                        }
                        var split_date = val.split('-');
                        if (split_date.length !== 3) {
                            return false;
                        }
                        return {day: split_date[0], month: split_date[1], year: split_date[2]};
                    }
                },
                validate: function (date) {
                    var isBisiesto = date.year % 4 === 0;
                    if (date.month < 1 || date.month > 12 || date.day < 1 || date.day > this.daysOfMonth[isBisiesto ? 0 : 1][date.month - 1] || date.year < 1) {
                        return false;
                    }
                    return true;
                },
                daysOfMonth: [[31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]]
            },
            rut: {
                getDV: function (rut) {
                    var sum = 0;
                    var j = 2;
                    for (var i = rut.length - 1; i >= 0; i--) {
                        sum += (rut[i] * j++);
                        if (j === 8) {
                            j = 2;
                        }
                    }
                    var real_dv = 11 - sum % 11;
                    if (real_dv === 10) {
                        real_dv = 'K';
                    } else if (real_dv === 11) {
                        real_dv = '0';
                    }
                    return real_dv.toString();
                }
            },
            isKeyCodeNumber: function (key_code) {
                //alert(key_code);
                return (key_code >= 48 && key_code <= 57) || (key_code >= 96 && key_code <= 105) || key_code === 13 || key_code === 8 || key_code === 9 || key_code === 46 || key_code === 44;
            }
        };


var HashMonitor = {
    ACTION_REG_EXP: /^#!\/(.*)\/(.*)\/?$/,
    handlers: {},
    init: function (handlers) {
        var self = this;
        this.handlers = handlers;
        $(window).on('hashchange', function () {
            self.handle();
        });
    },
    handle: function () {
        var hash = this.ACTION_REG_EXP.exec(window.location.hash);
        if (hash) {
            var action = hash[1];
            var params = hash[2];

            if (this.handlers[action] && typeof this.handlers[action] === 'function') {
                this.handlers[action](params);
            } else {
                console.log("Action " + action + " not listed as function");
            }
        } else {
            this.handlers.home();
        }
    }
};

GlobalOptions = {
    DatePicker: {
        dateFormat: 'dd/mm/yy',
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
        maxDate: 0,
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        nextText: 'Siguiente',
        prevText: 'Anterior',
        changeYear: true
    }
};
var AutoFormSaver = {
    form: null,
    saver: null,
    SAVE_URL: 'utils/forms/save',
    initialized: false,
    lastState: null,
    options: {
        formName: 'form',
        onSaving: function(){},
        onSaved: function(){},
        onInit: function(){},
        onChanged: function(){},
        checkInterval: 2500,
        key: null,
        url_prefix: ''
    },
    init: function(options){
        this.options = $.extend(this.options, options);
        this.form = this.getForm(this.options.formName);
        this.lastState = this.form.serialize();
        if(this.form.length === 0){
            return;
        }
        this._init();
    },
    getForm: function(name){
        var selector = "form[name=" + name + "]";
        return $(selector);
    },
    _init: function(){
        if(!this.initialized){
            this.options.onInit();
            this.initialized = true;
        }
        var self = this;
        var tm;
        self.form.find(':input').on('change input', function(){
            if(tm){
                clearTimeout(tm);
            }
            tm = setTimeout(function(){
                self.saveForm.call(self);
            }, self.options.checkInterval);
        });
    },
    saveForm: function(){
        if(this.stateChanged()){
            var self = this;
            var data = self.form.serializeArray();
            data.push({name: 'key', value: self.resolveKey()});
            $.ajax({
                url: self.options.url_prefix + self.SAVE_URL,
                type: 'post',
                data: data,
                beforeSend: function(){
                    self.options.onSaving();
                },
                error: function(){
                    self.options.onError();
                }

            }).done(function(){
                self.options.onSaved();
                //self._init();
            });
        }
    },
    resolveKey: function(){
        if($.isFunction(this.options.key)){
            var data = {};
            $.each(this.form.serializeArray(), function(i, item){
                data[item.name] = item.value;
            });
            return this.options.key(data);
        }
        return this.options.key;
    },
    stateChanged: function(){
        var changed = this.lastState !== this.form.serialize();
        this.lastState = this.form.serialize();
        if(changed){
            this.options.onChanged();
        }
        return changed;
    }
};