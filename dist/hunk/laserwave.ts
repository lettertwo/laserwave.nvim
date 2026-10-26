// GENERATED ON 2026-10-26 AT 18:21:45
// name:     laserwave
// author:   Eric Eldredge <lettertwo@gmail.com>
// license:  MIT
// upstream: https://github.com/lettertwo/laserwave.nvim/dist/hunk/laserwave.ts
// blurb:    Based on LaserWave for VSCode by Jared Jones
import type { HunkExtensionAPI } from "hunkdiff/extension";
export default function (hunk: HunkExtensionAPI) {
  hunk.registerTheme({
    id: "laserwave-nvim",
    label: "LaserWave (nvim)",
    base: "laserwave",
    background: "#27212E",
    panel: "#241E2B",
    panelAlt: "#352D3D",
    border: "#4F435F",
    accent: "#EB64B9",
    accentMuted: "#3F334A",
    text: "#FFFFFF",
    muted: "#91889B",
    addedBg: "#322B43",
    removedBg: "#35293D",
    movedAddedBg: "#332F48",
    movedRemovedBg: "#332A3B",
    contextBg: "#27212E",
    addedContentBg: "#3D446E",
    removedContentBg: "#55395B",
    contextContentBg: "#27212E",
    addedSignColor: "#40B4C4",
    removedSignColor: "#EB64B9",
    lineNumberBg: "#27212E",
    lineNumberFg: "#7B6995",
    selectedHunk: "#5A4568",
    badgeAdded: "#40B4C4",
    badgeRemoved: "#EB64B9",
    badgeNeutral: "#7B6995",
    fileNew: "#40B4C4",
    fileDeleted: "#EB64B9",
    fileRenamed: "#B381C5",
    fileModified: "#74DFC4",
    fileUntracked: "#FFB85B",
    noteBorder: "#EB64B9",
    noteBackground: "#241E2B",
    noteTitleBackground: "#352D3D",
    noteTitleText: "#FFE261",
  });
}
