using EmployeeService as service from '../../srv/EmployeeService';
annotate service.MyTasks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : 'Due Date',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Task Information',
            ID : 'TaskInformation',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Assigned Task Details',
                    ID : 'AssignedTaskDetails',
                    Target : '@UI.FieldGroup#AssignedTaskDetails',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Equipment Details',
                    ID : 'EquipmentDetails',
                    Target : '@UI.FieldGroup#EquipmentDetails',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'My issues',
            ID : 'Myissues',
            Target : 'issues/@UI.LineItem#Myissues',
        },
    ],
    UI.FieldGroup #TaskInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            
        ],
    },
    UI.FieldGroup #AssignedTaskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'description',
            },
            {
                $Type : 'UI.DataField',
                Value : dueDate,
                Label : 'dueDate',
            },
            {
                $Type : 'UI.DataField',
                Value : priority_code,
                Label : 'priority_code',
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'status_code',
            },
        ],
    },
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'description',
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.manufacturing,
                Label : 'manufacturing',
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.name,
            },
            {
                $Type : 'UI.DataField',
                Value : equipment.location_locationId,
                Label : 'location_locationId',
            },
        ],
    },
);

annotate service.MyIssues with @(
    UI.LineItem #Myissues : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'description',
        },
        {
            $Type : 'UI.DataField',
            Value : issueStatus_statusCode,
            Label : 'issueStatus_statusCode',
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
    ]
);

