function showProducts(event, category) {
    event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>
    
    const productList = document.getElementById('product-list');
    productList.innerHTML = ''; // Xóa các sản phẩm hiện tại

    // Dữ liệu sản phẩm mẫu
    const products = {
        electronics: [
            { name: "TV Samsung", description: "Smart TV 4K" },
            { name: "Điện thoại iPhone", description: "iPhone 13 Pro Max" },
            { name: "Laptop Dell", description: "XPS 13" }
        ],
        fashion: [
            { name: "Áo phông", description: "Áo phông nam thời trang" },
            { name: "Quần jean", description: "Quần jean nữ phong cách" },
            { name: "Đồng hồ", description: "Đồng hồ đeo tay cao cấp" }
        ],
        books: [
            { name: "Cuốn sách A", description: "Tiểu thuyết bán chạy nhất" },
            { name: "Cuốn sách B", description: "Sách khoa học phổ thông" },
            { name: "Cuốn sách C", description: "Sách tự học lập trình" }
        ]
    };

    // Lấy sản phẩm theo danh mục
    const selectedProducts = products[category];

    // Hiển thị sản phẩm
    selectedProducts.forEach(product => {
        const productDiv = document.createElement('div');
        productDiv.classList.add('product');

        const productTitle = document.createElement('h3');
        productTitle.textContent = product.name;

        const productDescription = document.createElement('p');
        productDescription.textContent = product.description;

        productDiv.appendChild(productTitle);
        productDiv.appendChild(productDescription);
        productList.appendChild(productDiv);
    });
}
