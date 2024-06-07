public class Product
{
    private int _productId;
    private string _productName;
    private int _categoryId;
    private decimal _price;
    private DateTime _createdDate;
    private DateTime _modifiedDate;

    public int ProductId 
    { 
        get { return _productId; }
        set { _productId = value; }
    }

    public string ProductName 
    { 
        get { return _productName; }
        set { _productName = value; }
    }

    public int CategoryId 
    { 
        get { return _categoryId; }
        set { _categoryId = value; }
    }

    public decimal Price 
    { 
        get { return _price; }
        set { _price = value; }
    }

    public DateTime CreatedDate 
    { 
        get { return _createdDate; }
        set { _createdDate = value; }
    }

    public DateTime ModifiedDate 
    { 
        get { return _modifiedDate; }
        set { _modifiedDate = value; }
    }
}