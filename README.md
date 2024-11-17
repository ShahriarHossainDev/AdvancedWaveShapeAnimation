
# **Advanced Wave Shape Animation**

![Advanced Wave Animation](G1.gif)

## **Overview**  
The **Advanced Wave Shape Animation** is a visually stunning SwiftUI project that demonstrates the power of custom shapes and animations. Featuring dynamic wave layers, customizable properties, and interactive controls, this project is perfect for enhancing your iOS apps with captivating loading animations or decorative effects.

---

## **Features**  
- 🌊 **Dynamic Wave Layers**: Multiple animated waves with different amplitudes, frequencies, and phases.  
- 🎨 **Gradient Effects**: Smoothly transitioning wave colors for a polished look.  
- ⚙️ **Interactive Controls**: Adjust wave properties like amplitude and frequency in real time.  
- 🔄 **Seamless Animations**: Continuous wave motion using SwiftUI’s `onAppear` and `withAnimation`.  
- 💡 **Reusable Components**: Easily integrate the wave animation into any SwiftUI project.

---

## **Demo**  
![Demo](G1.gif)  
A preview of the Advanced Wave Shape Animation in action.

---

## **Installation**  
1. Clone this repository:  
   ```bash
   git clone https://github.com/your-username/AdvancedWaveShapeAnimation.git
   ```
2. Open the project in Xcode:  
   ```bash
   cd AdvancedWaveShapeAnimation
   open AdvancedWaveShapeAnimation.xcodeproj
   ```
3. Run the project on your simulator or device.

---

## **Usage**  
This animation can be used as:  
- A **loading indicator** in apps.
- A **decorative background** in splash screens or headers.
- A **dynamic widget** to showcase advanced animations.

---

## **Customization**  
You can adjust wave behavior by modifying the following parameters in `AdvancedWaveShapeView.swift`:  
- **Amplitude**: Controls the height of the waves.  
- **Frequency**: Adjusts the number of wave peaks.  
- **Gradient Colors**: Change the wave colors in the `LinearGradient`.  

---

## **Code Highlights**  

### Wave Shape Definition  
The wave shape is created using SwiftUI's `Shape` protocol:  
```swift
struct AdvancedWaveShape: Shape {
    var amplitude: CGFloat
    var frequency: CGFloat
    var phase: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(amplitude, phase) }
        set {
            amplitude = newValue.first
            phase = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let midHeight = height / 2
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / width
            let sine = sin(relativeX * frequency * .pi * 2 + phase)
            let y = midHeight + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
```

### Animation Logic  
Waves are animated using `withAnimation` and `onAppear`:  
```swift
AdvancedWaveShape(amplitude: amplitude, frequency: frequency, phase: phase1)
    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .top, endPoint: .bottom))
    .onAppear {
        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
            phase1 += .pi * 2
        }
    }
```

---

## **Contributing**  
Contributions are welcome! Feel free to submit a pull request or open an issue to improve this project.

---

## **Contact**  
For questions or feedback, reach out to me on:  
- **GitHub**: [ShahriarHossainDev](https://github.com/ShahriarHossainDev)  
- **Email**: shahriar.hossain.dev@gmail.com

---

Let me know if you’d like help with further customization or adding more details!
