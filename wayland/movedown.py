# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2024 Your Name

import asyncio
from i3ipc.aio import Connection

FLOATING_MODES = ('auto_on', 'user_on')

async def move_down_stack():
    """
    Move the focused window down the stack in the current workspace.
    """
    i3 = await Connection(auto_reconnect=True).connect()
    tree = await i3.get_tree()
    focused = tree.find_focused()

    if not focused:
        return

    ws = focused.workspace()
    if not ws:
        return

    # Collect all tiled (non-floating) windows
    tiled_windows = [n for n in ws.leaves() if n.floating not in FLOATING_MODES and n.floating == 'auto_off']

    if len(tiled_windows) < 2:
        return

    try:
        idx = tiled_windows.index(focused)
        target_idx = (idx + 1) % len(tiled_windows)
        target_window = tiled_windows[target_idx]
        await i3.command(f'[con_id="{target_window.id}"] focus')
    except ValueError:
        pass

def main_script():
    asyncio.run(move_down_stack())

if __name__ == "__main__":
    main_script()

