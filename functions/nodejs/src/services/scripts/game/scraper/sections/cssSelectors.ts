// BASE
export const BASE_ELEMENT_SELECTOR = `article.message-body.js-selectToQuote:nth-of-type(1) > div.bbWrapper:nth-of-type(1)`;

// BLOCKED SECTIONS
export const BLOCKED_LINK_ELEMENT_SELECTOR = `:scope > div.messageHide.messageHide--link`;

// SPOILER
export const SPOILER_ELEMENT_SELECTOR = `:scope > div.bbCodeSpoiler`;
export const NESTED_SPOILER_ELEMENT_SELECTOR = `:scope > div > div > div > div.bbCodeSpoiler`;

// HEADER
export const HEADER_GENRE_ELEMENT_SELECTOR = `a.tagItem[href^="/tags"]`;
export const HEADER_IMAGE_AUTHENTICATED_SELECTOR = `${BASE_ELEMENT_SELECTOR} img`;
export const HEADER_IMAGE_NOT_AUTHENTICATED_SELECTOR = `${BASE_ELEMENT_SELECTOR} a`;

// DESCRIPTION
export const DESCRIPTION_ELEMENT_SELECTOR = `${BASE_ELEMENT_SELECTOR} > div[style="text-align: center"]:nth-of-type(1)`;
export const DESCRIPTION_BLOCKED_LINK_ELEMENT_SELECTOR = `:scope > div[style="text-align: center"]:nth-of-type(1) > div.messageHide.messageHide--link`;
export const DESCRIPTION_SPOILER_ELEMENT_SELECTOR = `:scope > div[style="text-align: center"]:nth-of-type(1) > div.bbCodeSpoiler`;

// DOWNLOADS
export const DOWNLOADS_ELEMENT_SELECTOR = `${BASE_ELEMENT_SELECTOR} > div[style="text-align: center"]:nth-last-of-type(1)`;
export const DOWNLOADS_BLOCKED_LINK_ELEMENT_SELECTOR = `:scope > div[style="text-align: center"]:nth-last-of-type(1) > div.messageHide.messageHide--link`;
export const DOWNLOADS_SPOILER_ELEMENT_SELECTOR = `:scope > div[style="text-align: center"]:nth-last-of-type(1) > div.bbCodeSpoiler`;

// GALLERY
export const GALLERY_ELEMENT_SELECTOR = `${BASE_ELEMENT_SELECTOR} > div[style="text-align: center"]:nth-last-of-type(1) > span:nth-of-type(1)`;
export const GALLERY_IMAGE_ELEMENT_SELECTOR = `:scope a:has(img.bbImage)`;
