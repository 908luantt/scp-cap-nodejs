namespace demo.products;
using { managed } from '@sap/cds/common';

entity Product: managed {
    key ID : Integer;
    Name:String(100);
    Description: String(200);
    ReleaseDate: DateTime;
    DiscontinuedDate: DateTime;
    Rating: Integer;
    Price: Decimal;  
    Category: Association[0..1] to Category on $self.Category.ID =  Category.ID;
    Supplier: Association[0..1] to Supplier on $self.Supplier.ID =  Supplier.ID;
}

entity Category: managed {
    key ID : Integer;
    Name:String(100);
    Products: Association[1..*] to Product on Products.ID = $self.Products.ID;
}

entity Supplier: managed {
    key ID : Integer;
    Name:String(100);
    Street: String(200);
    City:String(200);
    State:String(200);
    ZipCode:String(20);
    Country:String(100);
    Concurrency:Integer;
    Products: Association[1..*] to Product on Products.ID = $self.Products.ID;
}
