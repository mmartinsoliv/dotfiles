---
name: animation
description: Use when writing CSS animations, transitions, Framer Motion springs, or hover effects.
---

# Animation & Transition Guidelines

These guidelines ensure our user interface remains performant, accessible, and consistently snappy.

## ⚡ General Principles

* **Keep it fast:** Default to `ease-out` for most interactions.
* **Duration:** Animations should typically range between **0.2s and 0.3s**.
* **Limit:** Never exceed **1s** unless the animation is purely illustrative.

---

## 📈 Easing Rules

Avoid built-in CSS easings (except for `ease` or `linear`). Use the specific cubic-bezier values below:

### Ease-Out (Recommended)

*Best for elements entering the screen or user-initiated actions.*

| Name | Cubic Bezier Value |
| --- | --- |
| `ease-out-quad` | `cubic-bezier(.25, .46, .45, .94)` |
| `ease-out-cubic` | `cubic-bezier(.215, .61, .355, 1)` |
| `ease-out-quart` | `cubic-bezier(.165, .84, .44, 1)` |
| `ease-out-quint` | `cubic-bezier(.23, 1, .32, 1)` |
| `ease-out-expo` | `cubic-bezier(.19, 1, .22, 1)` |
| `ease-out-circ` | `cubic-bezier(.075, .82, .165, 1)` |

### Ease-In-Out

*Best for elements moving from one point to another within the screen.*

| Name | Cubic Bezier Value |
| --- | --- |
| `ease-in-out-quad` | `cubic-bezier(.455, .03, .515, .955)` |
| `ease-in-out-cubic` | `cubic-bezier(.645, .045, .355, 1)` |
| `ease-in-out-quart` | `cubic-bezier(.77, 0, .175, 1)` |
| `ease-in-out-quint` | `cubic-bezier(.86, 0, .07, 1)` |
| `ease-in-out-expo` | `cubic-bezier(1, 0, 0, 1)` |
| `ease-in-out-circ` | `cubic-bezier(.785, .135, .15, .86)` |

### Ease-In (Use Sparingly)

*Generally avoided as it can make the UI feel sluggish.*

| Name | Cubic Bezier Value |
| --- | --- |
| `ease-in-quad` | `cubic-bezier(.55, .085, .68, .53)` |
| `ease-in-cubic` | `cubic-bezier(.550, .055, .675, .19)` |
| `ease-in-quart` | `cubic-bezier(.895, .03, .685, .22)` |
| `ease-in-quint` | `cubic-bezier(.755, .05, .855, .06)` |
| `ease-in-expo` | `cubic-bezier(.95, .05, .795, .035)` |
| `ease-in-circ` | `cubic-bezier(.6, .04, .98, .335)` |

---

## 🖱️ Hover Transitions

* **Simple Transitions:** Use CSS `ease` with a **200ms** duration for `color`, `background-color`, and `opacity`.
* **Complex Transitions:** Fall back to the Easing Rules above.
* **Touch Optimization:** Always wrap hover styles in a media query to prevent "sticky" hover states on mobile:
```css
@media (hover: hover) and (pointer: fine) {
  /* Hover styles here */
}
```

---

## 🛠️ Performance & Technicals

### High-Performance Properties

Stick to **opacity** and **transforms**. Avoid animating layout-triggering properties like `top`, `left`, `width`, or `height`.

* **Hardware Acceleration:** When using Framer Motion, use `transform` instead of `x` or `y`.
* **`will-change`:** Use only for `transform`, `opacity`, `clipPath`, and `filter`.
* **Blur:** Do not animate blur values higher than **20px**.
* **Gestures:** Do not animate drag gestures using CSS variables.

### Origin-Awareness

Elements should animate relative to their trigger.

> **Example:** If a user clicks a button to open a popover, set the `transform-origin` to the button's position so the element appears to grow from the point of contact.

---

## 🌀 Spring Animations

* **Default:** Use springs for Framer Motion transitions.
* **Bounciness:** Avoid "bouncy" springs unless specifically handling **drag gestures**.

---

## ♿ Accessibility

Respect user system preferences for motion. If an animation uses `transform`, disable or simplify it for users who prefer reduced motion.

```css
@media (prefers-reduced-motion: reduce) {
  .animated-element {
    transform: none !important;
    transition: opacity 0.2s ease-in-out;
  }
}
```
