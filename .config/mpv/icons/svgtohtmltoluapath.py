import re
import subprocess
import os
import sys

canvasSizePattern = re.compile(r'    \<canvas id=\'canvas\' width=\'(-?\d+(\.\d+)?)\' height=\'(-?\d+(\.\d+)?)\'\>\<\/canvas\>')
transformPattern = re.compile(r'\tctx.transform\(.+')
moveToPattern = re.compile(r'\tctx.moveTo\((-?\d+\.\d+), (-?\d+\.\d+)\);')
lineToPattern = re.compile(r'\tctx.lineTo\((-?\d+\.\d+), (-?\d+\.\d+)\);')
curveToPattern = re.compile(r'\tctx.bezierCurveTo\((-?\d+\.\d+), (-?\d+\.\d+), (-?\d+\.\d+), (-?\d+\.\d+), (-?\d+\.\d+), (-?\d+\.\d+)\);')

def convertToCanvas(svgFilepath):
	svgDirpath, svgFilename = os.path.split(svgFilepath)
	htmlDirpath = os.path.join(svgDirpath, 'html')
	htmlFilepath = os.path.join(htmlDirpath, svgFilename.replace('.svg', '.html'))
	os.makedirs(htmlDirpath, exist_ok=True)
	subprocess.run([
		'inkscape',
		svgFilepath,
		'-o',
		htmlFilepath,
	])
	return htmlFilepath



def cleanNum(numstr):
	outstr = str(float(numstr))
	if outstr.endswith('.0'):
		outstr = outstr[:-2]
	return outstr

def generatePath(filepath):
	path = []
	with open(filepath, 'r') as fin:
		for line in fin.readlines():
			line = line.rstrip()
			# print(line)
			m = canvasSizePattern.match(line)
			if m:
				# MPV's ASS alignment centering crops the path itself.
				# For the path to retain position in the SVG viewbox,
				# we need to "move" to the corners of the viewbox.
				cmd = 'm 0 0' # Top Left
				path.append(cmd)
				w = cleanNum(m.group(1))
				h = cleanNum(m.group(3))
				cmd = 'm {} {}'.format(w, h) # Bottom Right
				# print('size', cmd)
				path.append(cmd)
				continue
			m = transformPattern.match(line)
			if m:
				print("[error] filepath:", filepath)
				print("Cannot parse ctx.transform()")
				print("Please ungroup path to remove transormation")
				sys.exit(1)
			m = moveToPattern.match(line)
			if m:
				x = cleanNum(m.group(1))
				y = cleanNum(m.group(2))
				cmd = 'm {} {}'.format(x, y)
				# print('moveTo', cmd)
				path.append(cmd)
				continue
			m = lineToPattern.match(line)
			if m:
				x = cleanNum(m.group(1))
				y = cleanNum(m.group(2))
				cmd = 'l {} {}'.format(x, y)
				# print('lineTo', cmd)
				path.append(cmd)
				continue
			m = curveToPattern.match(line)
			if m:
				x1 = cleanNum(m.group(1))
				y1 = cleanNum(m.group(2))
				x2 = cleanNum(m.group(3))
				y2 = cleanNum(m.group(4))
				x = cleanNum(m.group(5))
				y = cleanNum(m.group(6))
				cmd = 'b {} {} {} {} {} {}'.format(x1, y1, x2, y2, x, y)
				# print('curveTo', cmd)
				path.append(cmd)
				continue
	return '   '.join(path)


def printIcon(name, htmlFilename):
	path = generatePath(htmlFilename)
	print(r'local ' + name + r' = "{\\p1}' + path + r'{\\p0}"')

def genIconPath(name, svgFilepath):
	htmlFilepath = convertToCanvas(svgFilepath)
	printIcon(name, htmlFilepath)

print('---- Icons')
print('-- 44x44')
genIconPath('tethysIcon_play', 'tethys_play.svg')
genIconPath('tethysIcon_pause', 'tethys_pause.svg')
genIconPath('mpvOsdIcon_close', 'mpv_osd_close.svg')
genIconPath('mpvOsdIcon_maximize', 'mpv_osd_maximize.svg')
genIconPath('mpvOsdIcon_minimize', 'mpv_osd_minimize.svg')
genIconPath('mpvOsdIcon_restore', 'mpv_osd_restore.svg')
print('-- 32x28')
genIconPath('mpvOsdIcon_fs_enter', 'mpv_osd_fs_enter.svg')
genIconPath('mpvOsdIcon_fs_exit', 'mpv_osd_fs_exit.svg')
print('-- 28x28')
genIconPath('tethysIcon_ch_prev', 'tethys_ch_prev.svg')
genIconPath('tethysIcon_ch_next', 'tethys_ch_next.svg')
genIconPath('tethysIcon_pip_enter', 'tethys_pip_enter.svg')
genIconPath('tethysIcon_pip_exit', 'tethys_pip_exit.svg')
genIconPath('tethysIcon_pl_prev', 'tethys_pl_prev.svg')
genIconPath('tethysIcon_pl_next', 'tethys_pl_next.svg')
genIconPath('tethysIcon_skipback', 'tethys_skipback.svg')
genIconPath('tethysIcon_skipfrwd', 'tethys_skipfrwd.svg')
genIconPath('tethysIcon_speed', 'tethys_speed.svg')
genIconPath('tethysIcon_vol_033', 'tethys_vol_033.svg')
genIconPath('tethysIcon_vol_066', 'tethys_vol_066.svg')
genIconPath('tethysIcon_vol_100', 'tethys_vol_100.svg')
genIconPath('tethysIcon_vol_101', 'tethys_vol_101.svg')
genIconPath('tethysIcon_vol_mute', 'tethys_vol_mute.svg')
