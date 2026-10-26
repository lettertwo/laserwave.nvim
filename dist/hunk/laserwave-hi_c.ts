// GENERATED ON 2026-10-26 AT 18:21:45
// name:     laserwave-hi_c
// author:   Eric Eldredge <lettertwo@gmail.com>
// license:  MIT
// upstream: https://github.com/lettertwo/laserwave.nvim/dist/hunk/laserwave-hi_c.ts
// blurb:    Based on LaserWave for VSCode by Jared Jones
import type { HunkExtensionAPI } from "hunkdiff/extension";
export default function (hunk: HunkExtensionAPI) {
  hunk.registerTheme({
    id: "laserwave-hi_c-nvim",
    label: "LaserWave hi_c (nvim)",
    base: "laserwave",
    background: "#19151E",
    panel: "#17131C",
    panelAlt: "#27212E",
    border: "#65557A",
    accent: "#FF52BF",
    accentMuted: "#382A45",
    text: "#FFFFFF",
    muted: "#B4ABBE",
    addedBg: "#282236",
    removedBg: "#271E2E",
    movedAddedBg: "#272339",
    movedRemovedBg: "#282030",
    contextBg: "#19151E",
    addedContentBg: "#39416C",
    removedContentBg: "#4C2E52",
    contextContentBg: "#19151E",
    addedSignColor: "#1ED3EC",
    removedSignColor: "#FF52BF",
    lineNumberBg: "#19151E",
    lineNumberFg: "#B4A8C8",
    selectedHunk: "#5E3D74",
    badgeAdded: "#1ED3EC",
    badgeRemoved: "#FF52BF",
    badgeNeutral: "#B4A8C8",
    fileNew: "#1ED3EC",
    fileDeleted: "#FF52BF",
    fileRenamed: "#D887F5",
    fileModified: "#3FEABF",
    fileUntracked: "#FFB85B",
    noteBorder: "#FF52BF",
    noteBackground: "#17131C",
    noteTitleBackground: "#27212E",
    noteTitleText: "#FFE261",
  });
}
