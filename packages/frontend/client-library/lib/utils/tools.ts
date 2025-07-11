/**
 * Copyright 2025 grit42 A/S. <https://grit42.com/>
 *
 * This file is part of @grit42/client-library.
 *
 * @grit42/client-library is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or  any later version.
 *
 * @grit42/client-library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * @grit42/client-library. If not, see <https://www.gnu.org/licenses/>.
 */

export const generateUniqueID = (prefix = "") => {
  const timePart = new Date().getTime().toString(36);
  const randomPart = Math.random().toString(36).slice(2, 15);

  return `${prefix}${timePart}${randomPart}`;
};

export const downloadFile = (url: string) => {
  const link = document.createElement("a");

  link.setAttribute("href", url);
  link.click();
};

export const downloadBlob = (blob: Blob, fileName: string) => {
  try {
    const link = document.createElement("a");
    const url = URL.createObjectURL(blob);

    link.setAttribute("href", url);
    link.setAttribute("download", fileName);
    link.click();

    setTimeout(() => URL.revokeObjectURL(url), 1000);
  } catch (error) {
    console.error(`Failed to create blob URL: ${error}`);
  }
};
