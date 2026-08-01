import os

icons = [
    'Flash Icon.svg',
    'Bill Icon.svg',
    'Game Icon.svg',
    'Gift Icon.svg',
    'Discover.svg',
    'Shop Icon.svg',
    'Heart Icon.svg',
    'Chat bubble Icon.svg',
    'User Icon.svg',
    'Cart Icon.svg',
    'Bell.svg'
]

svg_content = '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/></svg>'

os.makedirs('assets/icons', exist_ok=True)

for icon in icons:
    path = os.path.join('assets/icons', icon)
    with open(path, 'w') as f:
        f.write(svg_content)
    print('Created ' + icon)
