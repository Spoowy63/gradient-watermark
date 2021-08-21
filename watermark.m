/*
IMPORTANT INFO: in this project i added the watermark to a UIWindow named "window" so 
change the word "window" to te view that youre adding this to, ex: (self, mainwindow, or something else)

the watermark will be located in the bottom left corner

made by: github.com/spoowy63
*/


NSString *WMText = @"github.com/spoowy63"; 
UILabel *watermark;

watermark = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, window.frame.size.width / 4, 20)];
watermark.backgroundColor = WMBGColor;
watermark.text = WMText;
watermark.adjustsFontSizeToFitWidth = YES;
watermark.center = CGPointMake(CGRectGetMinX(window.frame) + watermark.frame.size.width / 2 + 10, CGRectGetMaxY(window.frame) - watermark.frame.size.height - 5);
watermark.textAlignment = NSTextAlignmentCenter;

NSUInteger characterCount = [WMText length];

CGFloat randColor = arc4random_uniform(256) / 255.0;
int charsFinished;
CGFloat extraHue;

// making this value smaller will make the transition of color between charcters less noticeable (smoother)
// making this value bigger will make the transition of color between charcters more noticeable (less smooth)
CGFloat smoothness = 0.02;

NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: watermark.attributedText];

for (charsFinished = 0, extraHue = 0.0; charsFinished != characterCount; charsFinished = charsFinished + 1, extraHue = extraHue + smoothness) {
  [text addAttribute: NSForegroundColorAttributeName
    value: [UIColor colorWithHue:randColor + extraHue saturation:1.0 brightness:1.0 alpha:1.0]
    range: NSMakeRange(charsFinished, 1)];
}

[watermark setAttributedText: text];

//ADD WATERMARK TO THE VIEW YOU WANT 
[window addSubview: watermark];
