# VACCINE DISTRIBUTION ACROSS COUNTRY — SCHEMA

## VACCINE

Stores information about each vaccine.

Schema:

```
Vaccine(
    VaccineID PK,
    VaccineName,
    Manufacturer,
    VaccineType,
    NumberOfDose
)
```

## SUPPLIER

Stores information about vaccine suppliers.

Schema:

```
Supplier(
    supplierID PK,
    supplierName,
    contactPerson,
    Telephone,
    email
)
```

## SUPPLIER_VACCINE (Junction table)

Bridge (junction) table linking vaccines to their suppliers.

Schema:

```
Supplier_Vaccine(
    vaccineId FK,
    supplierid FK
)
```

Relationships
A vaccine can have many suppliers.
A supplier can supply many vaccines.
Therefore: Since this is a many-to-many relationship, a junction table is used.

## BATCHES

Stores batches of vaccine received from manufacturers.

Schema:

```
batches(
    batchNumber PK,
    ManufacturerDate,
    Expiringdate,
    QuantityReceived,
    vaccineId FK
)
```

Relationships
Vaccine (1) --------< (M) Batches.

## HEALTHFACILITY

Stores health facilities that receive vaccine distributions.

Schema:

```
HealthFacility(
    facilityId PK,
    facilityName,
    District,
    facilityType,
    TelephoneNumber
)
```

## DISTRIBUTION

Records distribution of vaccine batches to health facilities.

Schema:

```
distribution(
    distributionId PK,
    distributiondate,
    quantityDistributed,
    batchnumber FK,
    facilityId FK
)
```

Relationships
Batches (1) --------< (M) Distribution.
HealthFacility (1) --------< (M) Distribution.

## STAFFMEMBERS

Stores staff members working at health facilities.

Schema:

```
staffMembers(
    staffId PK,
    fullName,
    staffPosition,
    telephonenumber,
    facilityid FK
)
```

Relationships
HealthFacility (1) --------< (M) StaffMembers.
