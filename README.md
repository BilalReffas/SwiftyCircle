#SwiftyCircle


![SwiftyCircle](http://g.recordit.co/YAngkQ527k.gif)


SwiftyCircle makes really easy to use animated circles in your Xcode Project.
You can use the Interface Builder or just Code.
SwiftyCircle is completely written in Swift.


## Usage Inferface Builder
<img src="http://g.recordit.co/ixrOUon7kh.gif">

Just drag SwiftyCircle.swift to your project.

## Usage in code

`       let view = SwiftyCircle(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.centerFillColor = UIColor(red:0.13, green:0.44, blue:0.63, alpha:1)
        view.strokeColor = UIColor(red:0.15, green:0.67, blue:0.42, alpha:1)
        view.progress = 0.56
        view.backgroundColor = UIColor.clearColor()
        self.view.addSubview(view)`
 

## Requirements

Xcode 6.0 Swift 2.0


## Author

Bilal Karim Reffas

Twitter: [@reffas_bilal](https://twitter.com/reffas_bilal)


## License

The MIT License (MIT)
Copyright (c) 2015 Bilal Karim Reffas

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
