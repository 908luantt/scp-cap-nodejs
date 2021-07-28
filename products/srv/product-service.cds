using demo.products as prod from '../db/schema';

service ProductService {
    entity Products as projection on prod.Product{
        *, Category: redirected to Categories, Supplier: redirected to Suppliers
    }
    entity Categories as projection on prod.Category {
        *, Products: redirected to Products
    }
    entity Suppliers as projection on prod.Supplier {
        *, Products: redirected to Products
    }
}