from PIL import Image


def make_gif():
    frames = [Image.open(image) for image in ["loader.png", "loader2.png", "loader3.png", "loader4.png"]]
    frame_one = frames[0]
    frame_one.save("loader.gif", format="GIF", append_images=frames,
               save_all=True, duration=200, loop=0)


if __name__ == "__main__":
    make_gif()