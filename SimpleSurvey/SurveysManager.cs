﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace SimpleSurvey
{
    public class SurveysManager
    {
    }

    public enum QuestionTypes
    {
        SingleLineTextBox, // will render a textbox 
        MultiLineTextBox, // will render a text area
        YesOrNo, //will render a checkbox
        SingleSelect, //will render a dropdownlist
        MultiSelect //will render a listbox
    }
}