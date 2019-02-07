using ImageMagick;
using System;
using System.IO;

namespace magick_test
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length < 2)
            {
                Console.WriteLine("Wrong number of parameters.");
                Console.WriteLine("");
                Console.WriteLine("USAGE: magick_test input_path output_path");
                Environment.Exit(1);
            }
            //FileStream fileStream = new FileStream(args[0], FileMode.Open);
            using (MagickImage magickImage = new MagickImage(args[0]))
            {
                magickImage.Format = MagickFormat.Ptif;
                magickImage.Settings.SetDefine(MagickFormat.Tiff,
                    "ignore-layers",
                    true);
                magickImage.Settings.SetDefine(MagickFormat.Tiff,
                    "tile-geometry",
                    "256x256");
                magickImage.Settings.Compression = CompressionMethod.JPEG;
                magickImage.Settings.ColorSpace = ColorSpace.RGB;
                magickImage.Write(args[1]);
            }
        }
    }
}
