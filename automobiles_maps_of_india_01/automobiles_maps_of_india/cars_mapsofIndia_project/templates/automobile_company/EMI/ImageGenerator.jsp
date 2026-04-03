<%@ page import="java.io.*,java.lang.reflect.Array,java.util.*,java.awt.*,java.awt.Graphics2D,java.awt.image.*,javax.imageio.*,java.awt.geom.*" %>

<%
     String captcha=null;

        String imageFormat = "jpg";
        response.setContentType("image/" + imageFormat);
        try 
        {
             // you can pass in fontSize, width, height via the request
   
            Color backgroundColor = Color.white;
            Color borderColor = Color.black;
            Color textColor = Color.blue;
            Color circleColor = new Color(160,160,160);
            int paramInt=request.getParameter("fontSize") != null ? Integer.parseInt(request.getParameter("fontSize")) : 24;
            Font textFont = new Font("Arial", Font.PLAIN, paramInt);
            int charsToPrint = 5;
            int width=request.getParameter("width") != null ? Integer.parseInt(request.getParameter("width")) : 85;
            int height=request.getParameter("height") != null ? Integer.parseInt(request.getParameter("height")) : 40;
            
            int circlesToDraw = 6;
            float horizMargin = 10.0f;
            float imageQuality = 0.95f; // max is 1.0 (this is for jpeg)
            double rotationRange = 0.7; // in radians
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            Graphics2D g = null;
            g=(Graphics2D)bufferedImage.getGraphics();

            g.setColor(backgroundColor);
            g.fillRect(0, 0, width, height);

            // lets make some noisy circles
            g.setColor(circleColor);
            for ( int i = 0; i < circlesToDraw; i++ )
                {
                int circleRadius = (int) (Math.random() * height / 2.0);
                int circleX = (int) (Math.random() * width - circleRadius);
                int circleY = (int) (Math.random() * height - circleRadius);
                g.drawOval(circleX, circleY, circleRadius * 2, circleRadius * 2);
                 }

            g.setColor(textColor);
            g.setFont(textFont);

            FontMetrics fontMetrics = g.getFontMetrics();
            int maxAdvance = fontMetrics.getMaxAdvance();    //gives the maximum advance width of any character in this font
            int fontHeight = fontMetrics.getHeight();

            //Z,z,O,o,0,i,I,1,g,9 removed to avoid confusion to the human eye.
            String eligibleChars = "ABCDEFGHJKLMPQRSTUVWXYabcdefhjkmnpqrstuvwxy2345678";
            char[] chars = eligibleChars.toCharArray();  //converts the string into new character array

            float spaceForLetters = -horizMargin * 2 + width;
            float spacePerChar = spaceForLetters / (charsToPrint - 1.0f);

            AffineTransform transform = g.getTransform();   //inear mapping of coordinates and their transformation to Graphics2D

            StringBuffer finalString = new StringBuffer();//modifiable string

            for ( int i = 0; i < charsToPrint; i++ ) 
                {
                double randomValue = Math.random();
                int randomIndex = (int) Math.round(randomValue * (chars.length - 1));
                char characterToShow = chars[randomIndex];
                finalString.append(characterToShow);
                   
   

                // this is a separate canvas used for the character so that we can rotate it independently
                 
                 int charImageWidth = maxAdvance * 2;
                 int charImageHeight = fontHeight * 2;
                 int charWidth = fontMetrics.charWidth(characterToShow);
                 int charDim = Math.max(maxAdvance, fontHeight);
                 int halfCharDim = (int) (charDim / 2);

                BufferedImage charImage = new BufferedImage(charDim, charDim, BufferedImage.TYPE_INT_ARGB);  //constructs a buffered img of one of predefined img types.
                Graphics2D charGraphics = charImage.createGraphics();//draw into this buffered img.
                charGraphics.translate(halfCharDim, halfCharDim);    //concatenate current graphics2d transform with translation transform
                double angle = (Math.random() - 0.5) * rotationRange;
                charGraphics.transform(AffineTransform.getRotateInstance(angle));//rotating the text
                charGraphics.translate(-halfCharDim,-halfCharDim);
                charGraphics.setColor(textColor);
                charGraphics.setFont(textFont);

                int charX = (int) (0.5 * charDim - 0.5 * charWidth);
                 charGraphics.drawString("" + characterToShow, charX, (int) ((charDim - fontMetrics.getAscent()) / 2 + fontMetrics.getAscent()));

                float x = horizMargin + spacePerChar * (i) - charDim / 2.0f;
                int y = (int) ((height - charDim) / 2);
                //System.out.println("x=" + x + " height=" + height + " charDim=" + charDim + " y=" + y + " advance=" + maxAdvance + " fontHeight=" + fontHeight + " ascent=" + fontMetrics.getAscent());
                g.drawImage(charImage, (int) x, y, charDim, charDim, null, null); //color and img observer
                charGraphics.dispose();
                }
             captcha = finalString.toString();
            // let's do the border
             session.setAttribute("imagevalue",captcha);
            g.setColor(borderColor);
            g.drawRect(0, 0, width - 1, height - 1);
            
            //Write the image as a jpg
            Iterator iter = ImageIO.getImageWritersByFormatName(imageFormat);
            if( iter.hasNext() ) 
            {
            ImageWriter writer = (ImageWriter)iter.next();
            ImageWriteParam iwp = writer.getDefaultWriteParam(); //image encoding
                if ( imageFormat.equalsIgnoreCase("jpg") || imageFormat.equalsIgnoreCase("jpeg") ) 
                {
                     iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
                     iwp.setCompressionQuality(imageQuality);  //float value
                 }
            writer.setOutput(ImageIO.createImageOutputStream(response.getOutputStream()));
            IIOImage imageIO = new IIOImage(bufferedImage, null, null);//list and meta data;container class to agg an img
            writer.write(null, imageIO, iwp);  //insert new img into an existing img stream(img inx, iio img,iwp)
             } 
            else 
            {
                throw new RuntimeException("no encoder found for jpg");
             }
 
    
 } catch (IOException ioe) 
 {
   throw new RuntimeException("Unable to build image" , ioe);
 }
       
   
  
%>
