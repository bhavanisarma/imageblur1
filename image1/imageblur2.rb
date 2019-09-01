class Image
  attr_accessor :image
  def initialize(image)
    @image=image
  end
  def output_image
      @image.each do |row|
        puts row.join (" ")
       end
  end   

  def blur_image(n)
    number=n.to_i
    number.times do
      #getting points to blur
      def blur_points 
        blur_points = []
        @image.each_with_index do |row, x|
           row.each_with_index do |i, y|
              if i == 1
                 blur_points << [x, y]
              end
            end
          end
        blur_points
      end
      #transforming the image
    blur_points.each do |row,column|
      @image[row-1][column] = 1 unless row == 0
      @image[row+1][column] = 1 unless row >= @image.length-1
      @image[row][column -1] = 1 unless column == 0
      @image[row][column +1] = 1 unless column >= @image[0].length-1
    end  
    end
  end
end

image=Image.new([
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,1],
  [0,0,0,0]
])

image.blur_image(2)
image.output_image

