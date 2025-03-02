# test_demyst
 Assesment test from demyst for Senior iOS Position

# 📸 SwiftUI Instagram-Like Feed

An Instagram-style feed built using **SwiftUI & MVVM**, featuring **infinite scrolling, video autoplay, caching, and Imgur API integration**.

## 📌 Features
- 🔥 **Infinite Scrolling** – Loads posts dynamically when the user scrolls.
- 📸 **Mixed Media Support** – Displays both images and videos.
- 🎥 **Autoplay Videos** – Videos play when in view and pause when scrolled out.
- ⚡ **Performance Optimizations** – Implements caching for images/videos.

---

## 🏗️ Architecture
The project follows **MVVM (Model-View-ViewModel)**:

```
📂 test_demyst
│── 📂 Views
│   ├── FeedView.swift       # Main feed screen with posts
│   ├── PostCellView.swift   # Individual post UI (image/video)
│── 📂 ViewModel
│   ├── FeedViewModel.swift  # Handles data fetching & state management
│── 📂 DataModel
│   ├── Post.swift           # Defines post model
│── 📂 NetworkService
│   ├── ImgurService.swift   # Fetches posts from Imgur API
│── 📂 Caching
│   ├── VideoCache.swift     # Video caching to improve performance
│   ├── ImageCache.swift     # Image caching mechanism
│── 📂 Assets                # Contains app assets
│── 📜 README.md             # Project documentation
```

---

## ⚙️ Development Process (Assessment Test)

### **1️⃣ Building the Feed**
- Implemented `FeedView.swift` with `LazyVStack` for smooth scrolling.
- Integrated `FeedViewModel.swift` to fetch posts dynamically.

### **2️⃣ Implementing Video Autoplay & Caching**
- `VideoCache.swift` stores `AVPlayer` instances for efficiency.
- Videos autoplay when visible and pause when out of view.

### **3️⃣ Handling Infinite Scrolling**
- `FeedViewModel.swift` loads more posts when the last item appears.
- `ProgressView` is shown while fetching.

### **4️⃣ Performance Optimizations**
- Cached images/videos for faster loading.
- Used `DispatchQueue.main.async` to update UI smoothly.

---
