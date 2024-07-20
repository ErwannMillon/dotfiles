

import asyncio
import iterm2

async def update(connection, theme):
    parts = theme.split(" ")
    if "dark" in parts:
        preset = await iterm2.ColorPreset.async_get(connection, "Snazzy")
    else:
        preset = await iterm2.ColorPreset.async_get(connection, "Light Background")

    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)

async def main(connection):
    app = await iterm2.async_get_app(connection)
    theme = await app.async_get_variable("effectiveTheme")
    await update(connection, theme)

iterm2.run_until_complete(main)

