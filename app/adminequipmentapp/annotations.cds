using AdminService as service from '../../srv/AdminService';

annotate service.Equipments with @(
    UI.LineItem                        : [
        {
            $Type: 'UI.DataField',
            Label: 'Name',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: type.name,
            Label: 'Equipment Type',
        },
        {
            $Type: 'UI.DataField',
            Label: 'Type',
            Value: type_code
        },
        {
            $Type: 'UI.DataField',
            Label: 'Manufacturing',
            Value: manufacturing
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description
        },
        {
            $Type      : 'UI.DataField',
            Label      : 'Status',
            Value      : status_equipmentCode,
            Criticality: status.colorCode,
        },
    ],
    UI.SelectionFields                 : [
        type_code,
        status_equipmentCode,
    ],
    UI.Facets                          : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EquipmentDetails}',
            ID    : 'EquipmentDetails',
            Target: '@UI.FieldGroup#EquipmentDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Task Details',
            ID    : 'EquipmentTaskDetails',
            Target: 'tasks/@UI.LineItem#EquipmentTaskDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issue Details',
            ID    : 'IssueDetails',
            Target: 'issues/@UI.LineItem#IssueDetails',
        },
    ],
    UI.FieldGroup #EquipmentDetails    : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
                Label: 'ID',
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: status_equipmentCode,
            },
            {
                $Type: 'UI.DataField',
                Value: location_locationId,
                Label: 'Location',
            },
            {
                $Type: 'UI.DataField',
                Value: manufacturing,
                Label: 'Manufacturing',
            },
            {
                $Type: 'UI.DataField',
                Value: type_code,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt,
            },
        ],
    },
    UI.DataPoint #status_equipmentCode : {
        $Type      : 'UI.DataPointType',
        Value      : status_equipmentCode,
        Title      : 'Status',
        Criticality: status.colorCode,
    },
    UI.HeaderFacets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'status_equipmentCode',
            Target: '@UI.DataPoint#status_equipmentCode',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'createdBy',
            Target: '@UI.DataPoint#createdBy',
        },
    ],
    UI.DataPoint #createdBy            : {
        $Type: 'UI.DataPointType',
        Value: createdBy,
        Title: 'Created By',
    },
    UI.FieldGroup #EquipmentTaskDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [],
    },

);

annotate service.Equipments with {
    type @(
        Common.Label                   : 'Equipment Type',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'EquipmentTypes',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: type_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.EquipmentTypes with {
    code @Common.Text: name
};


annotate service.Equipments with {
    status @Common.Label: 'Status'
};

annotate service.EquipmentTypes with {
    name @Common.Text: code
};

annotate service.Equipments with @(UI.HeaderInfo: {
    TypeNamePlural: 'Equipments',
    TypeName      : 'name',
    Title         : {
        $Type: 'UI.DataField',
        Value: name
    },

});

annotate service.Tasks with @(UI.LineItem #EquipmentTaskDetails: [
    {
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'ID',
    },
    {
        $Type: 'UI.DataField',
        Value: description,
        Label: 'description',
    },
    {
        $Type: 'UI.DataField',
        Value: dueDate,
        Label: 'dueDate',
    },
    {
        $Type: 'UI.DataField',
        Value: priority_code,
        Label: 'priority_code',
    },
    {
        $Type: 'UI.DataField',
        Value: status_code,
        Label: 'status_code',
    },
    {
        $Type: 'UI.DataField',
        Value: assignedTo_ID,
        Label: 'assignedTo_ID',
    },
]);

annotate service.Issues with @(UI.LineItem #IssueDetails: [
    {
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'ID',
    },
    {
        $Type: 'UI.DataField',
        Value: description,
        Label: 'description',
    },
    {
        $Type: 'UI.DataField',
        Value: issueStatus_statusCode,
        Label: 'issueStatus_statusCode',
    },
    {
        $Type: 'UI.DataField',
        Value: reportedBy_ID,
        Label: 'reportedBy_ID',
    },
]);

annotate service.Tasks with {
    priority @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'TaskPriority',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: priority_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.Tasks with {
    status @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'TaskStatus',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.Tasks with {
    assignedTo @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Employees',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: assignedTo_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'username',
                },
            ],
        },
        Common.ValueListWithFixedValues: false,
        Common.Text                    : assignedTo.email,
    )
};

annotate service.Employees with {
    ID @Common.Text: email
};

annotate service.Equipments with {
    manufacturing @Common.FieldControl: #ReadOnly
};

//Updates the Manufaturing based on Equipment Type Dropdown using side effects
annotate service.Equipments with @(Common.SideEffects #updateManufacture: {
    SourceProperties: ['type_code'],
    TargetProperties: ['manufacturing']
});