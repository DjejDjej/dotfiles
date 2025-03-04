
from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import DrawData, ExtraData, TabBarData, draw_title
from kitty.utils import color_as_int

opts = get_options()

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:

    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)

    # Bold the active tab
    if tab.is_active:
        screen.cursor.bold = True

    screen.cursor.italic = False
    screen.cursor.bg = 0  # Transparent background
    screen.cursor.fg = 16777215  # White text (0xFFFFFF)
    screen.draw(f"[{index}]")

    screen.cursor.bold = False  # Reset bold
    screen.cursor.bg = 0
    screen.cursor.fg = 0

    if not is_last:
        screen.draw(" ")  # Separator

    return screen.cursor.x
